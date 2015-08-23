<pre class="highlight ruby"><code><span class="c1"># You will probably have found a solution that looks a little bit different</span>
<span class="c1"># from the one below.</span>
<span class="c1">#</span>
<span class="c1"># Here is a step by step refactoring from one solution from our groups:</span>
<span class="c1"># https://gist.github.com/svenfuchs/308e5f7f32b6e4920619</span>
<span class="c1">#</span>
<span class="c1"># Try understand each of the steps, and how it leads to the solution below.</span>

<span class="k">class</span> <span class="nc">Email</span>
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

<span class="k">class</span> <span class="nc">MailboxTextFormatter</span>
  <span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">mailbox</span><span class="p">)</span>
    <span class="vi">@mailbox</span> <span class="o">=</span> <span class="n">mailbox</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">format</span>
    <span class="n">lines</span> <span class="o">=</span> <span class="p">[</span>
      <span class="n">separator</span><span class="p">,</span>
      <span class="n">format_row</span><span class="p">([</span><span class="s2">"Date"</span><span class="p">,</span> <span class="s2">"From"</span><span class="p">,</span> <span class="s2">"Subject"</span><span class="p">]),</span>
      <span class="n">separator</span><span class="p">,</span>
      <span class="n">rows</span><span class="p">.</span><span class="nf">collect</span> <span class="p">{</span> <span class="o">|</span><span class="n">row</span><span class="o">|</span> <span class="n">format_row</span><span class="p">(</span><span class="n">row</span><span class="p">)</span> <span class="p">},</span>
      <span class="n">separator</span><span class="p">,</span>
    <span class="p">]</span>
    <span class="n">lines</span><span class="p">.</span><span class="nf">join</span><span class="p">(</span><span class="s2">"</span><span class="se">\n</span><span class="s2">"</span><span class="p">)</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">separator</span>
    <span class="s2">"+</span><span class="si">#{</span><span class="n">column_widths</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">width</span><span class="o">|</span> <span class="s1">'-'</span> <span class="o">*</span> <span class="p">(</span><span class="n">width</span> <span class="o">+</span> <span class="mi">2</span><span class="p">)</span> <span class="si">}</span><span class="s2">.join("</span><span class="o">+</span><span class="s2">")}+"</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">format_row</span><span class="p">(</span><span class="n">row</span><span class="p">)</span>
    <span class="n">cells</span> <span class="o">=</span> <span class="mi">0</span><span class="p">.</span><span class="nf">upto</span><span class="p">(</span><span class="n">row</span><span class="p">.</span><span class="nf">length</span> <span class="o">-</span> <span class="mi">1</span><span class="p">).</span><span class="nf">map</span> <span class="k">do</span> <span class="o">|</span><span class="n">ix</span><span class="o">|</span>
      <span class="n">row</span><span class="p">[</span><span class="n">ix</span><span class="p">].</span><span class="nf">ljust</span><span class="p">(</span><span class="n">column_widths</span><span class="p">[</span><span class="n">ix</span><span class="p">])</span>
    <span class="k">end</span>
    <span class="s2">"| </span><span class="si">#{</span><span class="n">cells</span><span class="p">.</span><span class="nf">join</span><span class="p">(</span><span class="s2">" | "</span><span class="p">)</span><span class="si">}</span><span class="s2"> |"</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">emails</span>
    <span class="vi">@mailbox</span><span class="p">.</span><span class="nf">emails</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">column_widths</span>
    <span class="n">columns</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">column</span><span class="o">|</span> <span class="n">column</span><span class="p">.</span><span class="nf">max_by</span> <span class="p">{</span> <span class="o">|</span><span class="n">cell</span><span class="o">|</span> <span class="n">cell</span><span class="p">.</span><span class="nf">length</span> <span class="p">}.</span><span class="nf">length</span> <span class="p">}</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">columns</span>
    <span class="n">rows</span><span class="p">.</span><span class="nf">transpose</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">rows</span>
    <span class="n">emails</span><span class="p">.</span><span class="nf">collect</span> <span class="p">{</span> <span class="o">|</span><span class="n">email</span><span class="o">|</span> <span class="p">[</span><span class="n">email</span><span class="p">.</span><span class="nf">date</span><span class="p">,</span> <span class="n">email</span><span class="p">.</span><span class="nf">from</span><span class="p">,</span> <span class="n">email</span><span class="p">.</span><span class="nf">subject</span><span class="p">]</span> <span class="p">}</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="n">emails</span> <span class="o">=</span> <span class="p">[</span>
  <span class="no">Email</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Homework this week"</span><span class="p">,</span> <span class="p">{</span> <span class="ss">:date</span> <span class="o">=&gt;</span> <span class="s2">"2014-12-01"</span><span class="p">,</span> <span class="ss">:from</span> <span class="o">=&gt;</span> <span class="s2">"Ferdous"</span> <span class="p">}),</span>
  <span class="no">Email</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Keep on coding! :)"</span><span class="p">,</span> <span class="p">{</span> <span class="ss">:date</span> <span class="o">=&gt;</span> <span class="s2">"2014-12-01"</span><span class="p">,</span> <span class="ss">:from</span> <span class="o">=&gt;</span> <span class="s2">"Dajana"</span> <span class="p">}),</span>
  <span class="no">Email</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Re: Homework this week"</span><span class="p">,</span> <span class="p">{</span> <span class="ss">:date</span> <span class="o">=&gt;</span> <span class="s2">"2014-12-02"</span><span class="p">,</span> <span class="ss">:from</span> <span class="o">=&gt;</span> <span class="s2">"Ariane"</span> <span class="p">})</span>
<span class="p">]</span>
<span class="n">mailbox</span> <span class="o">=</span> <span class="no">Mailbox</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">"Ruby Study Group"</span><span class="p">,</span> <span class="n">emails</span><span class="p">)</span>
<span class="n">formatter</span> <span class="o">=</span> <span class="no">MailboxTextFormatter</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="n">mailbox</span><span class="p">)</span>

<span class="nb">puts</span> <span class="n">formatter</span><span class="p">.</span><span class="nf">format</span>
</code></pre>
