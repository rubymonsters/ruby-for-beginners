<pre class="highlight ruby"><code><span class="n">numbers</span> <span class="o">=</span> <span class="p">[</span>
  <span class="p">[</span><span class="mi">1</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">3</span><span class="p">],</span>
  <span class="p">[</span><span class="mi">2</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">2</span><span class="p">],</span>
  <span class="p">[</span><span class="mi">3</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">1</span><span class="p">]</span>
<span class="p">]</span>

<span class="n">lines</span> <span class="o">=</span> <span class="n">numbers</span><span class="p">.</span><span class="nf">map</span> <span class="k">do</span> <span class="o">|</span><span class="n">row</span><span class="o">|</span>
  <span class="n">row</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">number</span><span class="o">|</span> <span class="s2">"*"</span> <span class="o">*</span> <span class="n">number</span> <span class="p">}.</span><span class="nf">join</span><span class="p">(</span><span class="s2">" "</span><span class="p">)</span>
<span class="k">end</span>

<span class="n">lines</span><span class="p">.</span><span class="nf">each</span> <span class="p">{</span> <span class="o">|</span><span class="n">line</span><span class="o">|</span> <span class="nb">puts</span> <span class="n">line</span> <span class="p">}</span>
</code></pre>
