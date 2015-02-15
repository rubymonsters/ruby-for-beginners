<pre class="highlight ruby"><code><span class="n">dictionary</span> <span class="o">=</span> <span class="p">{</span> <span class="ss">:one</span> <span class="o">=&gt;</span> <span class="s1">'uno'</span><span class="p">,</span> <span class="ss">:two</span> <span class="o">=&gt;</span> <span class="s1">'dos'</span><span class="p">,</span> <span class="ss">:three</span> <span class="o">=&gt;</span> <span class="s1">'tres'</span> <span class="p">}</span>
<span class="nb">p</span> <span class="n">dictionary</span><span class="p">.</span><span class="nf">key?</span><span class="p">(</span><span class="ss">:one</span><span class="p">)</span>

<span class="c1"># There's also the method has_key?, but key? is more common:</span>
<span class="c1"># p dictionary.key?(:one)</span>
</code></pre>
