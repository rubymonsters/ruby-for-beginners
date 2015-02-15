<pre class="highlight ruby"><code><span class="n">numbers</span> <span class="o">=</span> <span class="p">[</span><span class="mi">1</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">3</span><span class="p">,</span> <span class="mi">4</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="mi">6</span><span class="p">,</span> <span class="mi">7</span><span class="p">,</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">9</span><span class="p">,</span> <span class="mi">10</span><span class="p">]</span>
<span class="n">numbers</span> <span class="o">=</span> <span class="n">numbers</span><span class="p">.</span><span class="nf">select</span> <span class="p">{</span> <span class="o">|</span><span class="n">number</span><span class="o">|</span> <span class="n">number</span><span class="p">.</span><span class="nf">even?</span> <span class="p">}.</span><span class="nf">reverse</span>
<span class="n">numbers</span><span class="p">.</span><span class="nf">delete</span><span class="p">(</span><span class="mi">6</span><span class="p">)</span>
<span class="nb">p</span> <span class="n">numbers</span>

<span class="c1"># alternative solutions:</span>
<span class="c1">#</span>
<span class="c1"># numbers = numbers.slice(0, 2) + numbers.slice(-2, 2)</span>
<span class="c1"># numbers = numbers.select { |number| number != 6 }</span>
<span class="c1"># numbers = numbers.reject { |number| number == 6 }</span>
</code></pre>
