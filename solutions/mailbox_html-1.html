<pre class="highlight ruby"><code><span class="k">class</span> <span class="nc">Email</span>
  <span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">subject</span><span class="p">,</span> <span class="n">headers</span><span class="p">)</span>
    <span class="vi">@subject</span> <span class="o">=</span> <span class="n">subject</span>
    <span class="vi">@headers</span> <span class="o">=</span> <span class="n">headers</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">subject</span>
    <span class="vi">@subject</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">date</span>
    <span class="vi">@headers</span><span class="p">[</span><span class="ss">:date</span><span class="p">]</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">from</span>
    <span class="vi">@headers</span><span class="p">[</span><span class="ss">:from</span><span class="p">]</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="k">class</span> <span class="nc">Mailbox</span>
  <span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="nb">name</span><span class="p">,</span> <span class="n">emails</span><span class="p">)</span>
    <span class="vi">@name</span> <span class="o">=</span> <span class="nb">name</span>
    <span class="vi">@emails</span> <span class="o">=</span> <span class="n">emails</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">name</span>
    <span class="vi">@name</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">emails</span>
    <span class="vi">@emails</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="k">class</span> <span class="nc">MailboxHtmlFormatter</span>
  <span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">mailbox</span><span class="p">)</span>
    <span class="vi">@mailbox</span> <span class="o">=</span> <span class="n">mailbox</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">format</span>
    <span class="n">tag</span><span class="p">(</span><span class="ss">:html</span><span class="p">,</span> <span class="p">[</span><span class="n">head</span><span class="p">,</span> <span class="n">body</span><span class="p">].</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">))</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">body</span>
    <span class="n">tag</span><span class="p">(</span><span class="ss">:body</span><span class="p">,</span> <span class="p">[</span><span class="n">headline</span><span class="p">,</span> <span class="n">table</span><span class="p">].</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">))</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">headline</span>
    <span class="n">tag</span><span class="p">(</span><span class="ss">:h1</span><span class="p">,</span> <span class="vi">@mailbox</span><span class="p">.</span><span class="nf">name</span><span class="p">)</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">table</span>
    <span class="n">tag</span><span class="p">(</span><span class="ss">:table</span><span class="p">,</span> <span class="p">[</span><span class="n">thead</span><span class="p">,</span> <span class="n">tbody</span><span class="p">].</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">))</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">thead</span>
    <span class="n">tag</span><span class="p">(</span><span class="ss">:thead</span><span class="p">,</span> <span class="n">ths</span><span class="p">.</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">))</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">ths</span>
    <span class="n">headers</span> <span class="o">=</span> <span class="p">[</span><span class="s2">"Date"</span><span class="p">,</span> <span class="s2">"From"</span><span class="p">,</span> <span class="s2">"Subject"</span><span class="p">]</span>
    <span class="n">headers</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">content</span><span class="o">|</span> <span class="n">tag</span><span class="p">(</span><span class="ss">:th</span><span class="p">,</span> <span class="n">content</span><span class="p">)</span> <span class="p">}</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">tbody</span>
    <span class="n">tag</span><span class="p">(</span><span class="ss">:tbody</span><span class="p">,</span> <span class="n">trs</span><span class="p">.</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">))</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">trs</span>
    <span class="n">rows</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">row</span><span class="o">|</span> <span class="n">tr</span><span class="p">(</span><span class="n">row</span><span class="p">)</span> <span class="p">}</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">tr</span><span class="p">(</span><span class="n">row</span><span class="p">)</span>
    <span class="n">tag</span><span class="p">(</span><span class="ss">:tr</span><span class="p">,</span> <span class="n">tds</span><span class="p">(</span><span class="n">row</span><span class="p">).</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">))</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">tds</span><span class="p">(</span><span class="n">row</span><span class="p">)</span>
    <span class="n">row</span><span class="p">.</span><span class="nf">collect</span> <span class="p">{</span> <span class="o">|</span><span class="n">content</span><span class="o">|</span> <span class="n">tag</span><span class="p">(</span><span class="ss">:td</span><span class="p">,</span> <span class="n">content</span><span class="p">)</span> <span class="p">}</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">tag</span><span class="p">(</span><span class="nb">name</span><span class="p">,</span> <span class="n">content</span><span class="p">)</span>
    <span class="n">content</span> <span class="o">=</span> <span class="s2">"</span><span class="se">\n</span><span class="si">#{</span><span class="n">content</span><span class="si">}</span><span class="se">\n</span><span class="s2">"</span> <span class="k">unless</span> <span class="p">[</span><span class="ss">:h1</span><span class="p">,</span> <span class="ss">:td</span><span class="p">,</span> <span class="ss">:th</span><span class="p">].</span><span class="nf">include?</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span>
    <span class="n">html</span> <span class="o">=</span> <span class="s2">"&lt;</span><span class="si">#{</span><span class="nb">name</span><span class="si">}</span><span class="s2">&gt;</span><span class="si">#{</span><span class="n">content</span><span class="si">}</span><span class="s2">&lt;/</span><span class="si">#{</span><span class="nb">name</span><span class="si">}</span><span class="s2">&gt;"</span>
    <span class="n">html</span> <span class="o">=</span> <span class="n">indent</span><span class="p">(</span><span class="n">html</span><span class="p">)</span> <span class="k">unless</span> <span class="nb">name</span> <span class="o">==</span> <span class="ss">:html</span>
    <span class="n">html</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">indent</span><span class="p">(</span><span class="n">html</span><span class="p">)</span>
    <span class="n">lines</span> <span class="o">=</span> <span class="n">html</span><span class="p">.</span><span class="nf">split</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">)</span>
    <span class="n">lines</span> <span class="o">=</span> <span class="n">lines</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">line</span><span class="o">|</span> <span class="s2">" "</span> <span class="o">*</span> <span class="mi">2</span> <span class="o">+</span> <span class="n">line</span> <span class="p">}</span>
    <span class="n">lines</span><span class="p">.</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">)</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">rows</span>
    <span class="vi">@mailbox</span><span class="p">.</span><span class="nf">emails</span><span class="p">.</span><span class="nf">collect</span> <span class="k">do</span> <span class="o">|</span><span class="n">email</span><span class="o">|</span>
      <span class="p">[</span><span class="n">email</span><span class="p">.</span><span class="nf">date</span><span class="p">,</span> <span class="n">email</span><span class="p">.</span><span class="nf">from</span><span class="p">,</span> <span class="n">email</span><span class="p">.</span><span class="nf">subject</span><span class="p">]</span>
    <span class="k">end</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">head</span>
    <span class="s2">"&lt;head&gt;
      &lt;style&gt;
        table {
          border-collapse: collapse;
        }
        td, th {
          border: 1px solid black;
          padding: 1em;
        }
      &lt;/style&gt;
    &lt;/head&gt;"</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="n">emails</span> <span class="o">=</span> <span class="p">[</span>
  <span class="no">Email</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Homework this week"</span><span class="p">,</span> <span class="p">{</span> <span class="ss">:date</span> <span class="o">=&gt;</span> <span class="s2">"2014-12-01"</span><span class="p">,</span> <span class="ss">:from</span> <span class="o">=&gt;</span> <span class="s2">"Ferdous"</span> <span class="p">}),</span>
  <span class="no">Email</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Keep on coding! :)"</span><span class="p">,</span> <span class="p">{</span> <span class="ss">:date</span> <span class="o">=&gt;</span> <span class="s2">"2014-12-01"</span><span class="p">,</span> <span class="ss">:from</span> <span class="o">=&gt;</span> <span class="s2">"Dajana"</span> <span class="p">}),</span>
  <span class="no">Email</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Re: Homework this week"</span><span class="p">,</span> <span class="p">{</span> <span class="ss">:date</span> <span class="o">=&gt;</span> <span class="s2">"2014-12-02"</span><span class="p">,</span> <span class="ss">:from</span> <span class="o">=&gt;</span> <span class="s2">"Ariane"</span> <span class="p">})</span>
<span class="p">]</span>
<span class="n">mailbox</span> <span class="o">=</span> <span class="no">Mailbox</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Ruby Study Group"</span><span class="p">,</span> <span class="n">emails</span><span class="p">)</span>
<span class="n">formatter</span> <span class="o">=</span> <span class="no">MailboxHtmlFormatter</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="n">mailbox</span><span class="p">)</span>

<span class="nb">puts</span> <span class="n">formatter</span><span class="p">.</span><span class="nf">format</span>
</code></pre>
