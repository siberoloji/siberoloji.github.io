---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-05-16T12:58:00Z"
excerpt: Bazen yapmak istediğiniz işleme tam olarak uyan bir modül bulamazsınız. 2-3
  farklı modülün yaptığı işlemleri tek modülde toplamak istersiniz. Örneğin, evinizdeki
  ağınızı zafiyetlere karşı taramak ve kayıt altına almak isteyebilirsiniz. Metasploit
  Framework, bu tür amaçlar için kendi tarayıcı modülünüzü yazma imkanı sağlıyor.
guid: https://www.siberoloji.com/?p=1159
id: 1159
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Kendi Tarayıcınızı Yazma
url: /tr/msf-icinde-kendi-tarayicinizi-yazma/
---

  Bazen yapmak istediğiniz işleme tam olarak uyan bir modül bulamazsınız. 2-3 farklı modülün yaptığı işlemleri tek modülde toplamak istersiniz. Örneğin, evinizdeki ağınızı zafiyetlere karşı taramak ve kayıt altına almak isteyebilirsiniz. Metasploit Framework, bu tür amaçlar için kendi tarayıcı modülünüzü yazma imkanı sağlıyor.</p>
 

  Programlama diliyle söyleyecek olursak, Metasploit Framework içinde kullanılan bütün sınıflara (class) erişim ve kullanım imkanınız bulunmaktadır.</p>
 

 
<h2 class="wp-block-heading" id="tarayıcıların-bazı-özellikleri">Tarayıcıların bazı özellikleri</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Tüm exploit sınıf ve modüllerine erişim sağlarlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Proxy, SSL ve raporlama desteği bulunur.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Tarayıcı için THREAD yönetimi ve istenen aralıkta tarama desteği</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yazması ve çalıştırması çok kolaydır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Yazması ve çalıştırması kolay dense de kodlama biliyor olmanız size çok zaman kazandıracaktır. Bunu da ifade edelim. Aşağıdaki örnekte, TCP Exploit Modülü,&nbsp;<code>include</code>&nbsp;komutu ile sisteme dahil edilmekte ve bu modülün TCP bağlantı değişkenleri, istenen IP adresine bağlanmak için kullanılmaktadır. 12345 Portuna bağlantı sağlandıktan sonra sunucuya “HELLO SERVE” mesajı gönderilmektedir. Son olarak da sunucunun verdiği cevap ekrana yazdırılmaktadır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">require 'msf/core'
class Metasploit3 &lt; Msf::Auxiliary
        include Msf::Exploit::Remote::Tcp
        include Msf::Auxiliary::Scanner
        def initialize
                super<strong>(</strong>
                        'Name'           <strong>=&gt;</strong> 'My custom TCP scan',
                        'Version'        <strong>=&gt;</strong> '$Revision: 1 $',
                        'Description'    <strong>=&gt;</strong> 'My quick scanner',
                        'Author'         <strong>=&gt;</strong> 'Your name here',
                        'License'        <strong>=&gt;</strong> MSF_LICENSE
                <strong>)</strong>
                register_options<strong>(</strong>
                        <strong>[</strong>
                                Opt::RPORT<strong>(</strong>12345<strong>)</strong>
                        <strong>]</strong>, self.class<strong>)</strong>
        end

        def run_host<strong>(</strong>ip<strong>)</strong>
                connect<strong>()</strong>
      greeting <strong>=</strong> "HELLO SERVER" 
      sock.puts<strong>(</strong>greeting<strong>)</strong>
                data <strong>=</strong> sock.recv<strong>(</strong>1024<strong>)</strong>
                print_status<strong>(</strong>"Received: #{data} from #{ip}"<strong>)</strong>
                disconnect<strong>()</strong>
        end
end
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yazdığınız-tarayıcıyı-kaydetme">Yazdığınız Tarayıcıyı Kaydetme</h2>
<!-- /wp:heading -->

  Yazdığınız tarayıcıyı doğru yere kaydetmelisiniz.&nbsp;<code>msfconsole</code>&nbsp;başlarken modüller&nbsp;<code>./modules/auxuliary/scanner</code>&nbsp;klasöründen yüklenirler. O zaman yeni yazdığımız modülü&nbsp;<code>./modules/auxiliary/scanner/http/</code>&nbsp;klsörünün için simple_tcp.rb dosya adıyla Ruby uzantılı kayıt etmeliyiz. Ayrıntılı bilgi için&nbsp;<a href="https://siberoloji.github.io/Metasploit-temel-komutlar-ve-acikalamalari/">Metasploit Temel Komutlar -loadpath-</a>&nbsp;başlığını okuyabilirsiniz.</p>
 

  Deneyeceğimiz tarayıcı modülün mesajını yakalamak için&nbsp;<code>netcat</code>&nbsp;dinleme oturumu açabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# nc -lnvp 12345 &lt; response.txt
listening on <strong>[</strong>any] 12345 ...
</code></pre>
<!-- /wp:code -->

  Ardından yeni modülü seçip RHOST değişkenini ayarlıyoruz ve modülü çalıştırıyoruz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use scanner/simple_tcp
msf auxiliary<strong>(</strong>simple_tcp<strong>)</strong> <strong>&gt;</strong> set RHOSTS 192.168.1.100
RHOSTS <strong>=&gt;</strong> 192.168.1.100
msf auxiliary<strong>(</strong>simple_tcp<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> Received: hello metasploit from 192.168.1.100
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Detaylı kullanım örnekleri için Metasploit içerisinde bulunan modülleri incelemeniz tavsiye ediyorum.</p>
 

 
<h2 class="wp-block-heading" id="sonuçları-kaydetme">Sonuçları Kaydetme</h2>
<!-- /wp:heading -->

  Raporlama metodu&nbsp;<code>report_*()</code>&nbsp;kullanıcıya aşağıdaki imkanları sunar. Bunun için veri tabanı kullanıyor olmalısınız.</p>
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Veri tabanı bağlantısı olup olmadığını kontrol eder.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Çift kayıt olup olmadığını kontrol eder.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Bulunan bir kaydı tabloya yazar.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  report.*() metodunu kullanmak için aşağıdaki&nbsp;<code>include</code>&nbsp;satırını tarayıcı dosyanıza dahil etmelisiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">include Msf::Auxiliary::Report
</code></pre>
<!-- /wp:code -->

  Son olarak report_note() metodunu kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">report_note<strong>(</strong>
:host <strong>=&gt;</strong> rhost,
:type <strong>=&gt;</strong> "myscanner_password",
:data <strong>=&gt;</strong> data
<strong>)</strong></code></pre>
<!-- /wp:code -->