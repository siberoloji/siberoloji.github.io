---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-23T01:19:00Z"
guid: https://www.siberoloji.com/?p=1363
id: 1363
image: /assets/images/2024/06/cyber9.jpg
tags:
- how-to guides
- linux how-to
title: Linux RAM SWAP Balance
url: /linux-ram-swap-balance/
---

<!-- wp:heading {"level":1} -->
# RAM SWAP Balance 
<!-- /wp:heading -->

  How effectively do you use your computer's RAM (Random Access Memory) power? You heard from your friend how fast and much more stable computers with  Linux <a href="https://www.siberoloji.com/linux-ram-swap-dengesi/#"> operating</a> systems are and you installed them. However, you could not feel the speed you expected or you came to the point of saying it was not that fast. This article was prepared to remind you of a subject that may have been missing at that very point. The speed of your computer's RAM and the speed of the section called SWAP and used like RAM in the Hard Disk are not the same. 
 

  Making a small adjustment in this regard can increase  the computer speed and efficiency much higher. Let's put it this way. Tell your computer to open a 300 Mb. compressed file at the same time (click). Start the video you want to watch from your web browser with the Play button and stop it with the Pause button so that it continues to download while you do your other work. In the meantime, open a new desktop and start preparing the presentation of the seminar you will be doing in the evening there. It is quite normal to want to do the above-mentioned operations at the same time. Your processor should organize them. As its name suggests, Central Processing Unit. In this case, your processor will be loaded to the RAM capacity, and when RAM is not enough, it will immediately call for help from the SWAP area. The RAM will write some of the data to the SWAP area to make space on it. When needed, the necessary pages will be loaded back into RAM from the SWAP area. You will probably start to get some freezes and slow responses to your clicks in this scenario. Your computer will HOLD. IT IS HOLDING. 
 

  Now let's do a check together on the  Linux  operating system. Let's check your computer's Swappiness rate with the help of the command below. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat /proc/sys/vm/swappiness</code></pre>
<!-- /wp:code -->

  Most likely the result will be 60. This figure shows your computer's tendency to use SWAP memory when the amount of RAM is low. It is expressed with values ​​between 0-100. Although this is a normal rate on  Linux computers used as servers , this rate is higher on personal computers. When the tendency to use SWAP is excessive, writing to and reading from the disk inevitably occurs, even though it is thought to help RAM. And this slows down the computer. 
 

  Moreover, computers give priority to software and the execution of codes. Your music, documents etc. If  the software that will read and process your data does not work, the rest of the work cannot be done anyway, so the priority is in the software. In this case, the data you want to be read will most likely go from RAM to SWAP area, and then back from SWAP area to RAM memory. When this happens, your computer will lag, this is inevitable. 
 

  Let's create a rule for this and try it out. 
 

  If your RAM amount is 1 GB or more, vm.swappiness = 10 
 

  If your RAM amount is more than 1 GB, vm.swappiness=5 
 

  Open your /etc/sysctl.conf file with a text editor and the sudo command, paste the following line at the bottom and save. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/sysctl.conf</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Speeding up the computer by reducing the swap usage rate
vm.swappiness=10
</code></pre>
<!-- /wp:code -->

  Save the file, exit and restart your computer. Give the following command again when your computer starts. You will see that the value is 10. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cat /proc/sys/vm/swappiness</code></pre>
<!-- /wp:code -->

  Try your computer like this for a few days. See if there is a difference in speed. If nothing changes, you can return to your old settings as soon as you delete the lines we added to the sysctl.conf file. 
 