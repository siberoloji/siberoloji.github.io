---
draft: false
title: Local Network Scanner C++
translationKey: local-network-scanner-c
date: 2024-10-04T21:56:55+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /local-network-scanner-c/
featured_image: /images/cpp.png
categories:
    - C++ Code Samples
tags:
    - c++
    - c++ code samples
linkTitle: Network Scanner
description: If you want to scan your own network to find out live IP addresses, you can use the code below.
---


If you want to scan your own network to find out live IP addresses, you can use the code below. Use this code with caution, use it only with the network you own.

To compile and run this program:

Save the updated code to a file, e.g., `network_scanner.cpp`

Compile it:

```bash
`g++ -std=c++17 -o network_scanner network_scanner.cpp`
```

Run it with sudo:

```bash
sudo ./network_scanner
```

Here is the complete code.

```cpp
#include <iostream>
#include <fstream>
#include <string>
#include <stdexcept>
#include <array>
#include <chrono>
#include <thread>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip_icmp.h>

constexpr size_t PACKET_SIZE = 64;
constexpr std::chrono::seconds MAX_WAIT_TIME(1);

class NetworkScanner {
private:
    static uint16_t calculateChecksum(uint16_t *buf, int len) {
        uint32_t sum = 0;
        while (len > 1) {
            sum += *buf++;
            len -= 2;
        }
        if (len == 1) {
            sum += *reinterpret_cast<uint8_t *>(buf);
        }
        sum = (sum >> 16) + (sum & 0xFFFF);
        sum += (sum >> 16);
        return static_cast<uint16_t>(~sum);
    }

    static int ping(const std::string& ip_addr) {
        int sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);
        if (sockfd < 0) {
            throw std::runtime_error("Socket creation failed");
        }

        sockaddr_in addr{};
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = inet_addr(ip_addr.c_str());

        std::array<char, PACKET_SIZE> packet{};
        auto* icmp_header = reinterpret_cast<struct icmp*>(packet.data());
        icmp_header->icmp_type = ICMP_ECHO;
        icmp_header->icmp_code = 0;
        icmp_header->icmp_id = getpid();
        icmp_header->icmp_seq = 0;
        icmp_header->icmp_cksum = 0;
        icmp_header->icmp_cksum = calculateChecksum(reinterpret_cast<uint16_t*>(icmp_header), PACKET_SIZE);

        timeval tv{};
        tv.tv_sec = MAX_WAIT_TIME.count();
        tv.tv_usec = 0;
        setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));

        if (sendto(sockfd, packet.data(), PACKET_SIZE, 0, reinterpret_cast<sockaddr*>(&addr), sizeof(addr)) <= 0) {
            close(sockfd);
            return -1;
        }

        if (recvfrom(sockfd, packet.data(), packet.size(), 0, nullptr, nullptr) <= 0) {
            close(sockfd);
            return -1;
        }

        close(sockfd);
        return 0;
    }

public:
    static void scanNetwork(const std::string& base_ip) {
        std::ofstream file("scan_results.txt");
        if (!file) {
            throw std::runtime_error("Error opening file");
        }

        for (int i = 1; i <= 254; ++i) {
            std::string ip = base_ip + std::to_string(i);
            std::cout << "Pinging " << ip << "... ";

            try {
                if (ping(ip) == 0) {
                    std::cout << ip << " is reachable ";
                    file << ip << ' ';
                } else {
                    std::cout << ip << " is not reachable ";
                }
            } catch (const std::exception& e) {
                std::cerr << "Error pinging " << ip << ": " << e.what() << ' ';
            }

            // Add a small delay between pings to avoid overwhelming the network
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }

        std::cout << "Scan complete. Results saved in scan_results.txt ";
    }
};

int main() {
    try {
        NetworkScanner::scanNetwork("192.168.1.");
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << ' ';
        return 1;
    }
    return 0;
}
```
