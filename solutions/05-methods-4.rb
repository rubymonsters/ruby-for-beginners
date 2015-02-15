<pre class="highlight ruby"><code><span class="k">def</span> <span class="nf">leap_year?</span><span class="p">(</span><span class="n">year</span><span class="p">)</span>
  <span class="n">year</span> <span class="o">%</span> <span class="mi">4</span> <span class="o">==</span> <span class="mi">0</span>
<span class="k">end</span>

<span class="c1"># Bonus:</span>

<span class="k">def</span> <span class="nf">leap_year?</span><span class="p">(</span><span class="n">year</span><span class="p">)</span>
  <span class="n">year</span> <span class="o">%</span> <span class="mi">400</span> <span class="o">==</span> <span class="mi">0</span> <span class="n">or</span> <span class="n">year</span> <span class="o">%</span> <span class="mi">100</span> <span class="o">!=</span> <span class="mi">0</span> <span class="n">and</span> <span class="n">year</span> <span class="o">%</span> <span class="mi">4</span> <span class="o">==</span> <span class="mi">0</span>
<span class="k">end</span>
</code></pre>
