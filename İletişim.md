---
layout: page
title: İletişim
permalink: /contact/
---

<div class="container content"> 
	<section class="post-container"> 
		<form id="form" class="form" action="formaction" method="POST">
			<ul>
				<li>
					<label for="name">Adınız</label><br><input type="text" id="name" name="name" tabindex="1"><br>
				</li>
				<li> <label for="email">Eposta:</label><br><input type="email" id="email" name="_replyto" tabindex="2"><br>
				</li>
				<li> <label for="message">Mesaj:</label><br><textarea id="message" name="message" tabindex="3" rows="10" cols="60"></textarea><br>
				</li></ul> <br>
				<input type="submit" value="Gönder">
				<input type="text" name="_gotcha" style="display:none" />
				<input type="hidden" name="_next" value="{{site.baseurl}}/thanks.html" />
			</form>
			<script>
				var contactform =  document.getElementById('formaction');
				contactform.setAttribute('action', '//formspree.io/' + 'siberoloji' + '@' + 'protonmail' + '.' + 'com');
			</script>
</section>
</div>