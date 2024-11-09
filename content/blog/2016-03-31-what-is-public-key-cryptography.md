---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Cyber Security
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-03-31T13:48:00Z"
excerpt: In this article, we tried to explain the public/closed key encryption method
  that many of us have heard of but have not used. Let us state from the beginning
  that it is not a how-to document. We are just trying to explain the working logic.
guid: https://www.siberoloji.com/?p=1310
id: 1310
image: /assets/images/2024/06/cyber4.jpg
tags:
- cryptography
- cybersecurity
title: What is Public Key Cryptography?
url: /what-is-public-key-cryptography/
---

  In this article, we tried to explain the public/closed key encryption method that many of us have heard of but have not used. Let us state from the beginning that it is not a how-to document. We are just trying to explain the working logic.
 

<!-- wp:heading {"level":1} -->
# ENTRANCE: 
<!-- /wp:heading -->

  This method is different from the method known as the "symmetric encryption method", where encryption and decryption are done with the same key password.
 

  In the public key encryption method, the password owner has 2 keys. These are called public key and private key.
 

 
 ## 1.Public key:
<!-- /wp:heading -->

  It is a key similar to a private key, but distributed to everyone. It is given to everyone, either through file servers or through servers that act as key servers. The meaning is this; “If you want to send me an encrypted message, you can use this public key! Because only my Private Key can decrypt the public key that you use for encryption.
 

 
 ## 2.Private Key:
<!-- /wp:heading -->

  It exists only in its owner. Digital signature is used in encryption and decryption processes. It is not shared with anyone. If it is shared, a new private key is immediately generated and the previously published public key is revoked.
 

<!-- wp:heading {"level":1} -->
# CONCLUSION: 
<!-- /wp:heading -->


 ### Encrypting the Message:
<!-- /wp:heading -->

  The person who wants to send the secure message encrypts it with the recipient's public key and sends it. That message can only be opened with the recipient's private key.
 


 ### Signing the Message:
<!-- /wp:heading -->

  To prove that the secure message really comes from the sender, the SENDER SIGNS the message, which he encrypts with the public key, with his own PRIVATE KEY.
 

  Each party exchanging such messages has a wallet in which the recipient's public key is stored.
 


 ### If You Want to Use It, Steps:
<!-- /wp:heading -->

  To perform these operations;<br>You must install the Enigmail add-on to your Thunderbird mail program.
 

  For the Enigmail add-on to work, Thunderbird must be used in English.<br>For the Enigmail add-on to work, you must install gpg or gpg2.
 

  After all this, you should create your own private and public key with the Enigmail&gt;Setup wizard in Thunderbird.<br>You must broadcast the public key to people. To do this, you can transfer the public key to a file (pub key) with the Export option and&nbsp; save it at&nbsp;<a href="http://keyserver.pgp.com/">keyserver.pgp.com</a>&nbsp;&nbsp;, etc. You can install it on key servers.<br>To send mail, you must also have the public key of the other party.
 

  It may seem a little confusing at first because you are not used to it, but if you take some time and work on it, you can provide very secure mail communication.
 