<pre class="highlight ruby"><code><span class="k">class</span> <span class="nc">EmailsCsvStore</span>
  <span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">filename</span><span class="p">)</span>
    <span class="vi">@csv</span> <span class="o">=</span> <span class="no">CSV</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="no">File</span><span class="p">.</span><span class="nf">read</span><span class="p">(</span><span class="n">filename</span><span class="p">),</span> <span class="ss">headers: </span><span class="kp">true</span><span class="p">)</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">read</span>
    <span class="vi">@csv</span><span class="p">.</span><span class="nf">map</span> <span class="k">do</span> <span class="o">|</span><span class="n">row</span><span class="o">|</span>
      <span class="n">row</span> <span class="o">=</span> <span class="n">row</span><span class="p">.</span><span class="nf">to_hash</span>
      <span class="no">Email</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="n">row</span><span class="p">[</span><span class="s1">'Subject'</span><span class="p">],</span> <span class="p">{</span> <span class="ss">from: </span><span class="n">row</span><span class="p">[</span><span class="s1">'From'</span><span class="p">],</span> <span class="ss">date: </span><span class="n">row</span><span class="p">[</span><span class="s1">'Date'</span><span class="p">]</span> <span class="p">})</span>
    <span class="k">end</span>
  <span class="k">end</span>
<span class="k">end</span>
</code></pre>
