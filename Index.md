---
layout: page
title: Site Yazı İndeksi
permalink: /index/
---

<div class="home">
  <div class="row">
   <div class="col-md-8">
     <ul>
       
      {% for post in site.posts %}
      <li>
        <a class="post-link" target="_blank" href="{{ post.url | relative_url }}">{{ post.title}}</a>
      </li>  
      {% endfor %}
    </ul>
  </div>
</div>
<p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | relative_url }}">via RSS</a></p>
</div>