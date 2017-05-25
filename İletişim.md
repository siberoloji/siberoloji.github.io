---
layout: page
title: İletişim
permalink: /contact/
---



<form action="formaction" method="POST">
    <p>Adınız: </p><input type="text" name="name"><br />
    <p>Eposta: </p><input type="email" name="email"><br />
    <p>Mesaj: </p> <textarea name="message" rows="10" cols="60"></textarea> <br />
    <input type="submit" value="Gönder">
    <input type="text" name="_gotcha" style="display:none" />
    <input type="hidden" name="_next" value="{{site.baseurl}}/thanks.html" />
</form>
<script>
    var contactform =  document.getElementById('formaction');
    contactform.setAttribute('action', '//formspree.io/' + 'siberoloji' + '@' + 'protonmail' + '.' + 'com');
</script>