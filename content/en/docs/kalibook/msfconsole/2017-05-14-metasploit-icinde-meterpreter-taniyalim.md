---
draft: false
title: Introduction to Meterpreter in Metasploit
date: 2017-05-14T12:44:00+03:00
linkTitle: Meterpreter
weight: 90
translationKey: meterpreter-introduction-in-metasploit
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will briefly introduce Meterpreter, known as the command line environment provided to the user by the Metasploit Framework.
url: /meterpreter-introduction-in-metasploit/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
In this article, we will briefly introduce Meterpreter, known as the command line environment provided to the user by the Metasploit Framework. In the following articles, we will see plenty of commands and examples used in Meterpreter. Here is a brief introduction.

## What is Meterpreter?

Meterpreter is an advanced Metasploit payload type. It works dynamically on the target computer with DLL Injection logic. It communicates with the local computer on the network using stager payloads and sockets. It has command history, command completion, etc. capabilities. In short, we can say that it is a very effective command line running on the other party computer.

## How Does Meterpreter Work?

The stager module used in Metasploit works. This module is usually one of the bind, reverse, findtag, passivex modules. The stager module works in the system using DLL injection and provides communication to the Metasploit Framework over TLS/1.0. When communication is established, a GET request is sent and Metasploit, which receives this request, makes the necessary adjustments. The necessary modules are loaded according to the authorizations of the computer working on the other side and the opened command line is transferred to the user.

## Meterpreter Design Goals

## Privacy

Meterpreter runs entirely on RAM and does not write anything to the hard disk. When Meterpreter runs, a new process is not created in the other system. Meterpreter communicates with Metasploit encrypted. All these possibilities leave as few traces as possible on the other side.

## Powerful

Meterpreter uses a communication divided into channels. The TLV Protocol used by Meterpreter has a few limitations.

## Extensible

Meterpreter can be expanded with new modules even while it is running. It does not need to be recompiled when new codes and features are added.

## Adding New Features at Runtime

New features are added by loading extensions. The client loads DLL files over the socket. The Meterpreter server running on the other side loads the DLL file into memory. The new feature is automatically recognized by the server running on the other side. The client on the local computer loads the API interface provided by metasploit and can start using it immediately. All operations are completed in about 1 second.

## Conclusion

Although what is explained in this article may make a lot of sense to programmers, it may not make much sense to average users. No problem. It is enough to know that Meterpreter allows the user to perform operations with a very effective command line.
