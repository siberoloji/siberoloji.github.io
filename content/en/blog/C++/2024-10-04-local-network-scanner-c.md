---
draft: false

title:  'Local Network Scanner C++'
date: '2024-10-04T21:56:55+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /local-network-scanner-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


If you want to scan your own network to find out live IP addresses, you can use the code below. Use this code with caution, use it only with the network you own.



To compile and run this program:



Save the updated code to a file, e.g., `network_scanner.cpp`



Compile it: 


```bash
`g++ -std=c++17 -o network_scanner network_scanner.cpp
````



Run it with sudo:


```bash
sudo ./network_scanner
```



Here is the complete code.


```cpp
#include &lt;iostream&gt;
#include &lt;fstream&gt;
#include &lt;string&gt;
#include &lt;stdexcept&gt;
#include &lt;array&gt;
#include &lt;chrono&gt;
#include &lt;thread&gt;
#include &lt;unistd.h&gt;
#include &lt;arpa/inet.h&gt;
#include &lt;sys/socket.h&gt;
#include &lt;netinet/in.h&gt;
#include &lt;netinet/ip_icmp.h&gt;

constexpr size_t PACKET_SIZE = 64;
constexpr std::chrono::seconds MAX_WAIT_TIME(1);

class NetworkScanner {
private:
    static uint16_t calculateChecksum(uint16_t *buf, int len) {
        uint32_t sum = 0;
        while (len &gt; 1) {
            sum += *buf++;
            len -= 2;
        }
        if (len == 1) {
            sum += *reinterpret_cast&lt;uint8_t *&gt;(buf);
        }
        sum = (sum &gt;&gt; 16) + (sum &amp; 0xFFFF);
        sum += (sum &gt;&gt; 16);
        return static_cast&lt;uint16_t&gt;(~sum);
    }

    static int ping(const std::string&amp; ip_addr) {
        int sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);
        if (sockfd &lt; 0) {
            throw std::runtime_error("Socket creation failed");
        }

        sockaddr_in addr{};
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = inet_addr(ip_addr.c_str());

        std::array&lt;char, PACKET_SIZE&gt; packet{};
        auto* icmp_header = reinterpret_cast&lt;struct icmp*&gt;(packet.data());
        icmp_header-&gt;icmp_type = ICMP_ECHO;
        icmp_header-&gt;icmp_code = 0;
        icmp_header-&gt;icmp_id = getpid();
        icmp_header-&gt;icmp_seq = 0;
        icmp_header-&gt;icmp_cksum = 0;
        icmp_header-&gt;icmp_cksum = calculateChecksum(reinterpret_cast&lt;uint16_t*&gt;(icmp_header), PACKET_SIZE);

        timeval tv{};
        tv.tv_sec = MAX_WAIT_TIME.count();
        tv.tv_usec = 0;
        setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, &amp;tv, sizeof(tv));

        if (sendto(sockfd, packet.data(), PACKET_SIZE, 0, reinterpret_cast&lt;sockaddr*&gt;(&amp;addr), sizeof(addr)) &lt;= 0) {
            close(sockfd);
            return -1;
        }

        if (recvfrom(sockfd, packet.data(), packet.size(), 0, nullptr, nullptr) &lt;= 0) {
            close(sockfd);
            return -1;
        }

        close(sockfd);
        return 0;
    }

public:
    static void scanNetwork(const std::string&amp; base_ip) {
        std::ofstream file("scan_results.txt");
        if (!file) {
            throw std::runtime_error("Error opening file");
        }

        for (int i = 1; i &lt;= 254; ++i) {
            std::string ip = base_ip + std::to_string(i);
            std::cout &lt;&lt; "Pinging " &lt;&lt; ip &lt;&lt; "... ";

            try {
                if (ping(ip) == 0) {
                    std::cout &lt;&lt; ip &lt;&lt; " is reachable ";
                    file &lt;&lt; ip &lt;&lt; ' ';
                } else {
                    std::cout &lt;&lt; ip &lt;&lt; " is not reachable ";
                }
            } catch (const std::exception&amp; e) {
                std::cerr &lt;&lt; "Error pinging " &lt;&lt; ip &lt;&lt; ": " &lt;&lt; e.what() &lt;&lt; ' ';
            }

            // Add a small delay between pings to avoid overwhelming the network
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }

        std::cout &lt;&lt; "Scan complete. Results saved in scan_results.txt ";
    }
};

int main() {
    try {
        NetworkScanner::scanNetwork("192.168.1.");
    } catch (const std::exception&amp; e) {
        std::cerr &lt;&lt; "Error: " &lt;&lt; e.what() &lt;&lt; ' ';
        return 1;
    }
    return 0;
}
```
