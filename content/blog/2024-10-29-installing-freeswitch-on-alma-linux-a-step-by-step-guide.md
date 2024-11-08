---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Networks
date: "2024-10-29T13:26:36Z"
excerpt: Learn how to install FreeSWITCH on Alma Linux with this comprehensive guide.
  Follow each step to set up a robust telephony server on Alma Linux for a reliable
  VoIP solution.
guid: https://www.siberoloji.com/?p=5549
id: 5549
image: /assets/images/2024/10/freeswitch1.webp
tags:
- freeswitch
title: 'Installing FreeSWITCH on Alma Linux: A Step-by-Step Guide'
url: /installing-freeswitch-on-alma-linux-a-step-by-step-guide/
---

<!-- wp:heading {"level":3} -->
 ### Introduction</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>FreeSWITCH is a highly flexible and powerful open-source communications platform used for voice, video, and messaging across a variety of protocols. For those using Alma Linux—a reliable RHEL-based distribution—installing FreeSWITCH allows organizations to leverage a sophisticated telephony solution for VoIP applications, PBX systems, and conferencing. This guide provides a detailed, step-by-step walkthrough for installing FreeSWITCH on Alma Linux.</p>
  

<!-- wp:heading {"level":3} -->
 ### Prerequisites</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before beginning the installation, make sure you have:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>A server or virtual machine running Alma Linux</strong> (preferably version 8 or newer).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Root access</strong> to the server or a user with sudo privileges.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Basic understanding of Linux commands</strong>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>An internet connection</strong> to download necessary packages.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 1: Update the Alma Linux System</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Start by updating your Alma Linux system. This ensures you have the latest security patches and package updates.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf update -y</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Once the update is complete, reboot the system if necessary:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo reboot</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 2: Install Development Tools and Dependencies</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>FreeSWITCH relies on multiple development tools and libraries. You can install these packages with the following command:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf groupinstall "Development Tools" -y
sudo dnf install git wget cmake autoconf automake libtool -y</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Next, install additional dependencies that FreeSWITCH requires:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install epel-release -y
sudo dnf install libedit-devel sqlite-devel pcre-devel speex-devel openssl-devel -y</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 3: Set Up FreeSWITCH User and Directories</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For security and management, it’s best to create a dedicated user for running FreeSWITCH.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo adduser --system --no-create-home --group freeswitch</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Create necessary directories for FreeSWITCH:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkdir -p /usr/local/freeswitch
sudo mkdir -p /usr/local/freeswitch/log
sudo mkdir -p /usr/local/freeswitch/run</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Assign appropriate permissions to the FreeSWITCH user:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo chown -R freeswitch:freeswitch /usr/local/freeswitch
sudo chmod -R 775 /usr/local/freeswitch</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 4: Download FreeSWITCH Source Code</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Head to the FreeSWITCH GitHub repository to download the latest stable version of FreeSWITCH.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd /usr/src
sudo git clone https://github.com/signalwire/freeswitch.git
cd freeswitch
sudo git checkout v1.10</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>checkout</code> command will switch to the stable version 1.10, which is suitable for production use.</p>
  

<!-- wp:heading {"level":3} -->
 ### Step 5: Build and Compile FreeSWITCH</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>FreeSWITCH offers various configuration options; the default configuration works for most installations. First, install the necessary codecs, modules, and configurations:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">./bootstrap.sh
./configure</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>After configuring, compile the source code using:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">make</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This process may take several minutes. If there are any errors, ensure that all dependencies are correctly installed. After successfully compiling FreeSWITCH, install it by running:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo make install</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 6: Install Additional FreeSWITCH Modules</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>FreeSWITCH’s functionality can be extended by adding modules. Here’s how to install the basic modules often needed in a standard telephony environment:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo make cd-sounds-install cd-moh-install
sudo make samples</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>samples</code> command installs sample configuration files in <code>/usr/local/freeswitch/conf</code>.</p>
  

<!-- wp:heading {"level":3} -->
 ### Step 7: Configure Systemd Service for FreeSWITCH</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To ensure FreeSWITCH starts automatically and runs as a background service, create a systemd service file:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/systemd/system/freeswitch.service</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Insert the following configuration into the file:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[Unit]
Description=FreeSWITCH Service
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/freeswitch/bin/freeswitch -ncwait -nonat
ExecStop=/usr/local/freeswitch/bin/freeswitch -stop
PIDFile=/usr/local/freeswitch/run/freeswitch.pid
User=freeswitch
Group=freeswitch
Restart=always
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Save and exit the file. Reload the systemd daemon to recognize the new FreeSWITCH service:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl daemon-reload</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Enable the FreeSWITCH service to start automatically on boot:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable freeswitch</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 8: Start FreeSWITCH Service</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Start FreeSWITCH by executing:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start freeswitch</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>To confirm it’s running, check the status:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status freeswitch</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If the service is running, you should see an “active (running)” message.</p>
  

<!-- wp:heading {"level":3} -->
 ### Step 9: Configure Firewall for FreeSWITCH</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To allow external access to FreeSWITCH, open the necessary ports on your firewall. By default, FreeSWITCH uses:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>5060 (UDP)</strong> for SIP</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>5061 (UDP)</strong> for secure SIP (SIP-TLS)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>16384–32768 (UDP)</strong> for RTP (Real-Time Protocol)</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Use the following commands to open these ports:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --add-port=5060/udp --permanent
sudo firewall-cmd --add-port=5061/udp --permanent
sudo firewall-cmd --add-port=16384-32768/udp --permanent
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 10: Test FreeSWITCH Installation</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To verify the FreeSWITCH installation, connect to the FreeSWITCH CLI by running:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/usr/local/freeswitch/bin/fs_cli</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Once inside the CLI, you can test a few commands, such as:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">status
sofia status</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>These commands should display FreeSWITCH’s current status and protocol details, confirming that it’s correctly set up.</p>
  

<!-- wp:heading {"level":3} -->
 ### Step 11: Basic Configuration Tips</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>FreeSWITCH’s default configuration may not suit all needs. Here are a few tips to help configure it:</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Edit SIP Profiles</strong>: Modify SIP profiles in <code>/usr/local/freeswitch/conf/sip_profiles</code> to suit your network setup.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Set Up Extensions</strong>: Define extensions in <code>/usr/local/freeswitch/conf/dialplan/default.xml</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Configure NAT</strong>: If behind NAT, add your public IP and local network information in the SIP profiles.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Add Security Features</strong>: Enable password protections, and consider limiting IP access to the FreeSWITCH server.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Troubleshooting Common Issues</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Here are a few common issues that might arise during installation and their solutions:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Missing Dependencies</strong>: Ensure all libraries are installed, especially <code>openssl-devel</code> and <code>libedit-devel</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Firewall Blocks</strong>: Confirm all required ports are open on the firewall.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>FreeSWITCH Doesn’t Start</strong>: Check the system log (<code>journalctl -xe</code>) for details on errors-preventing startup.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Conclusion</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Installing FreeSWITCH on Alma Linux gives users access to a highly flexible telephony platform for handling voice, video, and messaging services. By following this guide, you’ll be able to successfully set up FreeSWITCH on Alma Linux, allowing your organization or personal projects to take advantage of its powerful communication capabilities. With FreeSWITCH running, you can begin configuring and customizing it to meet your specific telephony requirements.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:paragraph -->
<p><strong>FAQs</strong></p>
  

<!-- wp:paragraph -->
<p><strong>1. What is FreeSWITCH used for?</strong><br>FreeSWITCH is an open-source telephony platform used for handling voice, video, and messaging over various protocols, ideal for creating VoIP, PBX, and conferencing solutions.</p>
  

<!-- wp:paragraph -->
<p><strong>2. Why use Alma Linux for FreeSWITCH?</strong><br>Alma Linux is a stable, RHEL-compatible OS, making it a reliable choice for hosting applications like FreeSWITCH that require enterprise-level stability.</p>
  

<!-- wp:paragraph -->
<p><strong>3. How much RAM is recommended for FreeSWITCH?</strong><br>For basic setups, 1 GB of RAM is sufficient, but for larger deployments, consider 4 GB or more to handle higher call volumes and multiple concurrent calls.</p>
  

<!-- wp:paragraph -->
<p><strong>4. Can FreeSWITCH run alongside other VoIP software?</strong><br>Yes, but it’s generally recommended to run it on a dedicated server to avoid port conflicts and performance issues.</p>
  

<!-- wp:paragraph -->
<p><strong>5. How do I secure FreeSWITCH?</strong><br>Implement strong password policies, restrict access to SIP ports, and enable TLS for secure communication.</p>
  

<!-- wp:paragraph -->
<p><strong>6. Where can I get additional FreeSWITCH modules?</strong><br>Modules can be installed from the FreeSWITCH source repository, and the <a href="https://developer.signalwire.com/freeswitch/" target="_blank" rel="noopener" title="">FreeSWITCH documentation</a> provides details on individual module functions and configurations.</p>
  