<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="true" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Two Numbers Explained</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
        }
        .container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        h1 {
            color: #667eea;
            text-align: center;
            margin-bottom: 10px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 18px;
        }
        .problem {
            background: #f0f4ff;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            border-left: 5px solid #667eea;
        }
        .section {
            margin: 30px 0;
            padding: 20px;
            background: #fafafa;
            border-radius: 10px;
        }
        .section h2 {
            color: #764ba2;
            margin-top: 0;
        }
        .step {
            margin: 20px 0;
            padding: 15px;
            background: white;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        .step h3 {
            color: #667eea;
            margin-top: 0;
        }
        .linked-list {
            display: flex;
            align-items: center;
            margin: 15px 0;
            flex-wrap: wrap;
        }
        .node {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 20px;
            border-radius: 8px;
            margin: 5px;
            min-width: 50px;
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        .arrow {
            font-size: 24px;
            color: #667eea;
            margin: 0 10px;
        }
        .carry {
            background: #ff6b6b;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
            display: inline-block;
            margin-left: 10px;
        }
        .code-block {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 15px;
            border-radius: 8px;
            overflow-x: auto;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            margin: 15px 0;
        }
        .highlight {
            background: #fffacd;
            padding: 2px 5px;
            border-radius: 3px;
            font-weight: bold;
        }
        .visualization {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border: 2px solid #667eea;
        }
        .math {
            font-size: 20px;
            font-weight: bold;
            color: #764ba2;
            margin: 10px 0;
            text-align: center;
        }
        .label {
            font-size: 12px;
            color: #666;
            text-transform: uppercase;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .key-point {
            background: #e8f5e9;
            border-left: 4px solid #4caf50;
            padding: 15px;
            margin: 15px 0;
            border-radius: 5px;
        }
        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 20px 0;
        }
        .btn {
            background: #667eea;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #764ba2;
        }
        .btn:disabled {
            background: #ccc;
            cursor: not-allowed;
        }


        h1 {
            color: #667eea;
            text-align: center;
            margin-bottom: 30px;
        }
        .content-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 30px;
        }
        @media (max-width: 968px) {
            .content-grid {
                grid-template-columns: 1fr;
            }
        }
        .section {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            border-left: 5px solid #667eea;
        }
        .section h2 {
            color: #764ba2;
            margin-top: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .pseudocode {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 20px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            line-height: 1.6;
            overflow-x: auto;
        }
        .keyword {
            color: #ff79c6;
            font-weight: bold;
        }
        .function {
            color: #50fa7b;
        }
        .variable {
            color: #8be9fd;
        }
        .comment {
            color: #6272a4;
            font-style: italic;
        }
        .number {
            color: #bd93f9;
        }
        .flowchart {
            background: white;
            padding: 20px;
            border-radius: 8px;
            overflow-x: auto;
        }
        .shape {
            margin: 10px auto;
            padding: 15px;
            text-align: center;
            max-width: 300px;
            font-size: 13px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .start-end {
            background: #4caf50;
            color: white;
            border-radius: 25px;
            font-weight: bold;
        }
        .process {
            background: #2196f3;
            color: white;
            border-radius: 5px;
        }
        .decision {
            background: #ff9800;
            color: white;
            clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
            padding: 30px 15px;
            font-weight: bold;
        }
        .input-output {
            background: #9c27b0;
            color: white;
            clip-path: polygon(10% 0%, 100% 0%, 90% 100%, 0% 100%);
        }
        .arrow {
            text-align: center;
            font-size: 24px;
            color: #667eea;
            margin: 5px 0;
        }
        .arrow-label {
            font-size: 12px;
            color: #666;
            font-weight: bold;
            text-align: center;
            margin: -5px 0 5px 0;
        }
        .split {
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            margin: 20px 0;
        }
        .branch {
            flex: 1;
            padding: 0 10px;
        }
        .legend {
            background: #e3f2fd;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        .legend-item {
            display: flex;
            align-items: center;
            gap: 15px;
            margin: 10px 0;
        }
        .legend-shape {
            width: 80px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            color: white;
            font-weight: bold;
        }
        .full-width {
            grid-column: 1 / -1;
        }
        .highlight-box {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 15px;
            margin: 15px 0;
            border-radius: 5px;
        }
        .code-line {
            margin: 5px 0;
        }


        .code-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .code-header h3 {
            margin: 0;
            font-size: 18px;
        }

        button {
            background-color: #2563eb;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #1e40af;
        }

        pre {
            background-color: #0f172a;
            color: #e5e7eb;
            padding: 18px;
            border-radius: 8px;
            overflow-x: auto;
            font-size: 14px;
            line-height: 1.5;
        }

        /* Smooth hide / show */
        .hidden {
            display: none;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>🔗 Add Two Numbers - Linked List Problem</h1>
    <p class="subtitle">Understanding the Algorithm Step by Step</p>

    <div class="problem">
        <h3>📝 The Problem</h3>
        <p><strong>You are given two linked lists representing two numbers in REVERSE order.</strong></p>
        <p>Each node contains a single digit. Add the two numbers and return the sum as a linked list.</p>
        <div style="margin-top: 15px;">
            <strong>Example:</strong><br>
            Input: (2 → 4 → 3) + (5 → 6 → 4)<br>
            This represents: 342 + 465 = 807<br>
            Output: (7 → 0 → 8)
        </div>
    </div>

    <div class="problem">
        <div class="code-header">
            <h3>📝 Code Example</h3>
            <button id="toggleBtn" onclick="toggleCode()">
                👁 Hide Code
            </button>
        </div>

        <pre id="codeBlock"><code>
            /**
             * Definition for singly-linked list.
             * public class ListNode {
             *     int val;
             *     ListNode next;
             *     ListNode() {}
             *     ListNode(int val) { this.val = val; }
             *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
             * }
             */
            class Solution {
                public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
                    ListNode dummy_list = new ListNode(0);
                    ListNode l3 = dummy_list;

                    int carry = 0;
                    while(l1 != null || l2 != null){
                        int l1_value, l2_value;
                        if(l1 != null)
                            l1_value = l1.val;
                        else
                            l1_value = 0;

                        if(l2 != null)
                            l2_value = l2.val;
                        else
                            l2_value = 0;

                        int current_sum = l1_value + l2_value + carry;
                        carry = current_sum/10;
                        int last_digit = current_sum%10;
                        ListNode new_node = new ListNode(last_digit);
                        l3.next = new_node;
                        if(l1 != null)  l1 = l1.next;
                        if(l2 != null)  l2 = l2.next;
                        l3 = l3.next;
                    }
                    if(carry > 0){
                        ListNode new_node = new ListNode(carry);
                        l3.next = new_node;
                        l3 = l3.next;
                    }
                    return dummy_list.next;
                }

            }
        </code></pre>
    </div>

    <div class="section">
        <h2>🎯 Key Concept: Think Like Elementary School Addition</h2>
        <p>Remember adding numbers by hand? You add column by column from RIGHT to LEFT, carrying over when the sum is ≥ 10.</p>
        <div class="visualization">
            <div class="math">
                <div style="text-align: right; font-family: monospace;">
                    &nbsp;&nbsp;3 4 2<br>
                    + 4 6 5<br>
                    -------<br>
                    &nbsp;&nbsp;8 0 7
                </div>
            </div>
        </div>
        <p><strong>Since the linked lists are already REVERSED, we can add from left to right naturally!</strong></p>
    </div>

    <div class="section">
        <h2>🔧 Algorithm Overview</h2>
        <ol>
            <li>Create a <strong>dummy node</strong> to simplify list building</li>
            <li>Keep track of the <strong>carry</strong> (starts at 0)</li>
            <li>Loop through both lists simultaneously</li>
            <li>At each position: add values + carry, create new node</li>
            <li>Move to next nodes</li>
            <li>Handle final carry if needed</li>
        </ol>
    </div>

    <div id="stepContainer"></div>

    <div class="nav-buttons">
        <button class="btn" id="prevBtn" onclick="changeStep(-1)">← Previous</button>
        <button class="btn" id="nextBtn" onclick="changeStep(1)">Next →</button>
    </div>

    <div class="section">
        <h2>💡 Why Use a Dummy Node?</h2>
        <div class="key-point">
            <strong>Dummy Node Trick:</strong> Instead of handling the first node as a special case, we create a dummy node (value = 0) at the start. This way, we can always use <code>l3.next = new_node</code> uniformly. At the end, we return <code>dummy_list.next</code> to skip the dummy.
        </div>
    </div>

    <div class="section">
        <h2>⏱️ Complexity Analysis</h2>
        <p><strong>Time Complexity:</strong> O(max(m, n)) - where m and n are the lengths of the two lists</p>
        <p><strong>Space Complexity:</strong> O(max(m, n)) - for the result list</p>
    </div>

    <div class="content-grid">
        <!-- PSEUDOCODE SECTION -->
        <div class="section">
            <h2>📝 Pseudocode (Easy to Read)</h2>
            <div class="pseudocode">
                <div class="code-line"><span class="keyword">FUNCTION</span> <span class="function">addTwoNumbers</span>(<span class="variable">l1</span>, <span class="variable">l2</span>):</div>
                <div class="code-line">    <span class="comment">// Step 1: Initialize</span></div>
                <div class="code-line">    <span class="variable">dummy_node</span> = <span class="keyword">CREATE</span> <span class="keyword">new</span> Node(<span class="number">0</span>)</div>
                <div class="code-line">    <span class="variable">current</span> = <span class="variable">dummy_node</span></div>
                <div class="code-line">    <span class="variable">carry</span> = <span class="number">0</span></div>
                <div class="code-line"></div>
                <div class="code-line">    <span class="comment">// Step 2: Loop through both lists</span></div>
                <div class="code-line">    <span class="keyword">WHILE</span> <span class="variable">l1</span> is <span class="keyword">NOT NULL</span> <span class="keyword">OR</span> <span class="variable">l2</span> is <span class="keyword">NOT NULL</span>:</div>
                <div class="code-line">        </div>
                <div class="code-line">        <span class="comment">// Get values (0 if null)</span></div>
                <div class="code-line">        <span class="keyword">IF</span> <span class="variable">l1</span> is <span class="keyword">NOT NULL</span>:</div>
                <div class="code-line">            <span class="variable">value1</span> = <span class="variable">l1</span>.val</div>
                <div class="code-line">        <span class="keyword">ELSE</span>:</div>
                <div class="code-line">            <span class="variable">value1</span> = <span class="number">0</span></div>
                <div class="code-line">        </div>
                <div class="code-line">        <span class="keyword">IF</span> <span class="variable">l2</span> is <span class="keyword">NOT NULL</span>:</div>
                <div class="code-line">            <span class="variable">value2</span> = <span class="variable">l2</span>.val</div>
                <div class="code-line">        <span class="keyword">ELSE</span>:</div>
                <div class="code-line">            <span class="variable">value2</span> = <span class="number">0</span></div>
                <div class="code-line">        </div>
                <div class="code-line">        <span class="comment">// Calculate sum</span></div>
                <div class="code-line">        <span class="variable">total_sum</span> = <span class="variable">value1</span> + <span class="variable">value2</span> + <span class="variable">carry</span></div>
                <div class="code-line">        </div>
                <div class="code-line">        <span class="comment">// Extract carry and digit</span></div>
                <div class="code-line">        <span class="variable">carry</span> = <span class="variable">total_sum</span> / <span class="number">10</span>  <span class="comment">// Integer division</span></div>
                <div class="code-line">        <span class="variable">digit</span> = <span class="variable">total_sum</span> % <span class="number">10</span>   <span class="comment">// Remainder</span></div>
                <div class="code-line">        </div>
                <div class="code-line">        <span class="comment">// Create new node and attach</span></div>
                <div class="code-line">        <span class="variable">new_node</span> = <span class="keyword">CREATE</span> <span class="keyword">new</span> Node(<span class="variable">digit</span>)</div>
                <div class="code-line">        <span class="variable">current</span>.next = <span class="variable">new_node</span></div>
                <div class="code-line">        <span class="variable">current</span> = <span class="variable">current</span>.next</div>
                <div class="code-line">        </div>
                <div class="code-line">        <span class="comment">// Move to next nodes</span></div>
                <div class="code-line">        <span class="keyword">IF</span> <span class="variable">l1</span> is <span class="keyword">NOT NULL</span>:</div>
                <div class="code-line">            <span class="variable">l1</span> = <span class="variable">l1</span>.next</div>
                <div class="code-line">        <span class="keyword">IF</span> <span class="variable">l2</span> is <span class="keyword">NOT NULL</span>:</div>
                <div class="code-line">            <span class="variable">l2</span> = <span class="variable">l2</span>.next</div>
                <div class="code-line">    </div>
                <div class="code-line">    <span class="comment">// Step 3: Handle final carry</span></div>
                <div class="code-line">    <span class="keyword">IF</span> <span class="variable">carry</span> > <span class="number">0</span>:</div>
                <div class="code-line">        <span class="variable">new_node</span> = <span class="keyword">CREATE</span> <span class="keyword">new</span> Node(<span class="variable">carry</span>)</div>
                <div class="code-line">        <span class="variable">current</span>.next = <span class="variable">new_node</span></div>
                <div class="code-line">    </div>
                <div class="code-line">    <span class="comment">// Step 4: Return result (skip dummy)</span></div>
                <div class="code-line">    <span class="keyword">RETURN</span> <span class="variable">dummy_node</span>.next</div>
                <div class="code-line"><span class="keyword">END FUNCTION</span></div>
            </div>

            <div class="highlight-box">
                <strong>💡 Key Points:</strong>
                <ul style="margin: 10px 0; padding-left: 20px;">
                    <li><strong>Carry:</strong> total_sum / 10 (integer division)</li>
                    <li><strong>Digit:</strong> total_sum % 10 (remainder)</li>
                    <li><strong>Dummy node:</strong> Simplifies edge cases</li>
                    <li><strong>Null handling:</strong> Use 0 when list ends</li>
                </ul>
            </div>
        </div>

        <!-- SIMPLIFIED PSEUDOCODE -->
        <div class="section">
            <h2>✨ Simplified Version (One-liner style)</h2>
            <div class="pseudocode">
                <div class="code-line"><span class="keyword">ALGORITHM</span> AddTwoLinkedLists:</div>
                <div class="code-line"></div>
                <div class="code-line"><span class="number">1.</span> Create dummy = Node(<span class="number">0</span>), current = dummy, carry = <span class="number">0</span></div>
                <div class="code-line"></div>
                <div class="code-line"><span class="number">2.</span> <span class="keyword">WHILE</span> (l1 ≠ null <span class="keyword">OR</span> l2 ≠ null):</div>
                <div class="code-line">     • Get val1 from l1 (or <span class="number">0</span> if null)</div>
                <div class="code-line">     • Get val2 from l2 (or <span class="number">0</span> if null)</div>
                <div class="code-line">     • sum = val1 + val2 + carry</div>
                <div class="code-line">     • carry = sum ÷ <span class="number">10</span></div>
                <div class="code-line">     • digit = sum mod <span class="number">10</span></div>
                <div class="code-line">     • current.next = Node(digit)</div>
                <div class="code-line">     • Move current, l1, l2 forward</div>
                <div class="code-line"></div>
                <div class="code-line"><span class="number">3.</span> <span class="keyword">IF</span> carry > <span class="number">0</span>:</div>
                <div class="code-line">     • current.next = Node(carry)</div>
                <div class="code-line"></div>
                <div class="code-line"><span class="number">4.</span> <span class="keyword">RETURN</span> dummy.next</div>
            </div>

            <div class="highlight-box">
                <strong>📊 Example Walkthrough:</strong>
                <div style="font-family: monospace; margin-top: 10px; line-height: 1.8;">
                    Input: (2→4→3) + (5→6→4)<br>
                    <br>
                    <strong>Iteration 1:</strong> 2+5+0 = 7 → [7], carry=0<br>
                    <strong>Iteration 2:</strong> 4+6+0 = 10 → [7,0], carry=1<br>
                    <strong>Iteration 3:</strong> 3+4+1 = 8 → [7,0,8], carry=0<br>
                    <br>
                    Output: 7→0→8 (represents 807)
                </div>
            </div>
        </div>
    </div>

    <!-- FLOWCHART SECTION -->
    <div class="section full-width">
        <h2>📊 Flowchart Diagram</h2>
        <div class="flowchart">
            <div class="shape start-end">START</div>
            <div class="arrow">↓</div>

            <div class="shape process">Create dummy node = 0<br>current = dummy<br>carry = 0</div>
            <div class="arrow">↓</div>

            <div class="shape decision">l1 ≠ null OR<br>l2 ≠ null?</div>

            <div class="split">
                <div class="branch">
                    <div class="arrow-label">YES →</div>
                    <div class="shape process">Get value1<br>(l1.val or 0)</div>
                    <div class="arrow">↓</div>

                    <div class="shape process">Get value2<br>(l2.val or 0)</div>
                    <div class="arrow">↓</div>

                    <div class="shape process">sum = value1 + value2 + carry</div>
                    <div class="arrow">↓</div>

                    <div class="shape process">carry = sum / 10<br>digit = sum % 10</div>
                    <div class="arrow">↓</div>

                    <div class="shape process">Create new node(digit)<br>current.next = new node</div>
                    <div class="arrow">↓</div>

                    <div class="shape process">Move pointers:<br>current = current.next<br>l1 = l1.next (if not null)<br>l2 = l2.next (if not null)</div>
                    <div class="arrow">↓</div>
                    <div style="text-align: center; color: #667eea; font-size: 14px; margin: 10px 0;">← Loop back to decision</div>
                </div>

                <div class="branch">
                    <div class="arrow-label">← NO</div>
                    <div class="shape decision">carry > 0?</div>

                    <div style="margin: 20px 0;">
                        <div class="arrow-label" style="margin-bottom: 10px;">YES ↓</div>
                        <div class="shape process">Create node(carry)<br>current.next = new node</div>
                        <div class="arrow">↓</div>
                    </div>

                    <div class="arrow-label">NO ↓</div>
                    <div class="shape input-output">RETURN dummy.next</div>
                    <div class="arrow">↓</div>

                    <div class="shape start-end">END</div>
                </div>
            </div>
        </div>

        <!-- LEGEND -->
        <div class="legend">
            <h3 style="margin-top: 0;">📌 Flowchart Legend</h3>
            <div class="legend-item">
                <div class="legend-shape start-end" style="border-radius: 20px;">Start/End</div>
                <span>Program beginning and end</span>
            </div>
            <div class="legend-item">
                <div class="legend-shape process">Process</div>
                <span>Action or calculation step</span>
            </div>
            <div class="legend-item">
                <div class="legend-shape decision" style="clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);">Decision</div>
                <span>Yes/No question or condition</span>
            </div>
            <div class="legend-item">
                <div class="legend-shape input-output" style="clip-path: polygon(10% 0%, 100% 0%, 90% 100%, 0% 100%);">Output</div>
                <span>Return result</span>
            </div>
        </div>
    </div>

    <!-- TIME COMPLEXITY -->
    <div class="section full-width">
        <h2>⚡ Complexity Analysis</h2>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div style="background: #e8f5e9; padding: 20px; border-radius: 8px;">
                <h3 style="color: #2e7d32; margin-top: 0;">⏱️ Time Complexity</h3>
                <p><strong>O(max(m, n))</strong></p>
                <p>Where m = length of l1, n = length of l2</p>
                <p>We visit each node exactly once.</p>
            </div>
            <div style="background: #e3f2fd; padding: 20px; border-radius: 8px;">
                <h3 style="color: #1565c0; margin-top: 0;">💾 Space Complexity</h3>
                <p><strong>O(max(m, n))</strong></p>
                <p>For the result linked list</p>
                <p>In worst case, result has max(m,n) + 1 nodes.</p>
            </div>
        </div>
    </div>
</div>

<script>
    const steps = [
        {
            title: "Step 0: Initialization",
            explanation: "We start by creating a dummy node and setting up our pointers and carry variable.",
            code: `ListNode dummy_list = new ListNode(0);
ListNode l3 = dummy_list;
int carry = 0;`,
            visual: {
                l1: [2, 4, 3],
                l2: [5, 6, 4],
                result: [0],
                carry: 0,
                l1Pos: -1,
                l2Pos: -1,
                resultPos: 0
            },
            notes: "The dummy node (value 0) is our anchor point. We'll build the result list starting from here."
        },
        {
            title: "Step 1: Add First Digits (2 + 5)",
            explanation: "We take the first digits: 2 from l1 and 5 from l2. Add them with carry (0).",
            code: `l1_value = 2, l2_value = 5
current_sum = 2 + 5 + 0 = 7
carry = 7 / 10 = 0
last_digit = 7 % 10 = 7
Create new node with value 7`,
            visual: {
                l1: [2, 4, 3],
                l2: [5, 6, 4],
                result: [0, 7],
                carry: 0,
                l1Pos: 0,
                l2Pos: 0,
                resultPos: 1,
                calculation: "2 + 5 + 0 = 7"
            },
            notes: "Sum is 7 (less than 10), so no carry. We create a node with value 7."
        },
        {
            title: "Step 2: Add Second Digits (4 + 6)",
            explanation: "Now we take 4 from l1 and 6 from l2. Add them with carry (0).",
            code: `l1_value = 4, l2_value = 6
current_sum = 4 + 6 + 0 = 10
carry = 10 / 10 = 1  ← We have a carry!
last_digit = 10 % 10 = 0
Create new node with value 0`,
            visual: {
                l1: [2, 4, 3],
                l2: [5, 6, 4],
                result: [0, 7, 0],
                carry: 1,
                l1Pos: 1,
                l2Pos: 1,
                resultPos: 2,
                calculation: "4 + 6 + 0 = 10 → digit=0, carry=1"
            },
            notes: "Sum is 10! We store 0 and carry 1 to the next position."
        },
        {
            title: "Step 3: Add Third Digits (3 + 4 + carry)",
            explanation: "Take 3 from l1, 4 from l2, PLUS the carry (1) from previous step.",
            code: `l1_value = 3, l2_value = 4
current_sum = 3 + 4 + 1 = 8
carry = 8 / 10 = 0
last_digit = 8 % 10 = 8
Create new node with value 8`,
            visual: {
                l1: [2, 4, 3],
                l2: [5, 6, 4],
                result: [0, 7, 0, 8],
                carry: 0,
                l1Pos: 2,
                l2Pos: 2,
                resultPos: 3,
                calculation: "3 + 4 + 1 = 8"
            },
            notes: "Don't forget the carry! Sum is 8, no new carry needed."
        },
        {
            title: "Step 4: Final Result",
            explanation: "Both lists are exhausted and carry is 0. We return dummy_list.next to skip the dummy node.",
            code: `return dummy_list.next;
// This gives us: 7 → 0 → 8`,
            visual: {
                l1: [2, 4, 3],
                l2: [5, 6, 4],
                result: [7, 0, 8],
                carry: 0,
                l1Pos: -1,
                l2Pos: -1,
                resultPos: -1,
                calculation: "Final: 342 + 465 = 807"
            },
            notes: "Result: 7 → 0 → 8 represents 807 (remember it's reversed!)"
        }
    ];

    let currentStep = 0;

    function renderStep(stepIndex) {
        const step = steps[stepIndex];
        const container = document.getElementById('stepContainer');

        let html = `
                <div class="step">
                    <h3>${step.title}</h3>
                    <p><strong>${step.explanation}</strong></p>

                    <div class="visualization">
                        <div class="label">List 1 (l1):</div>
                        <div class="linked-list">
                            ${step.visual.l1.map((val, i) => `
                                <div class="node" style="${i === step.visual.l1Pos ? 'border: 3px solid #ff6b6b;' : ''}">${val}</div>
                                ${i < step.visual.l1.length - 1 ? '<span class="arrow">→</span>' : ''}
                            `).join('')}
                        </div>

                        <div class="label" style="margin-top: 15px;">List 2 (l2):</div>
                        <div class="linked-list">
                            ${step.visual.l2.map((val, i) => `
                                <div class="node" style="${i === step.visual.l2Pos ? 'border: 3px solid #ff6b6b;' : ''}">${val}</div>
                                ${i < step.visual.l2.length - 1 ? '<span class="arrow">→</span>' : ''}
                            `).join('')}
                        </div>

                        ${step.visual.calculation ?  `
                            <div class="math" style="margin: 20px 0;">
                                ${step.visual.calculation}
                            </div>
                        ` : ''}

                        <div class="label" style="margin-top: 15px;">Result List (l3):</div>
                        <div class="linked-list">
                            ${step.visual.result.map((val, i) => {
                                if (stepIndex === 0 || (stepIndex === 4 && i === 0)) return '';
                                return `
                                    <div class="node" style="${i === step.visual.resultPos ? 'border: 3px solid #4caf50;' : ''}">${val}</div>
                                    ${i < step.visual.result.length - 1 ? '<span class="arrow">→</span>' : ''}
                                `;
                            }).join('')}
                            ${step.visual.carry > 0 ? `<span class="carry">Carry: ${step.visual.carry}</span>` : ''}
                        </div>
                    </div>

                    <div class="code-block">${escapeHtml(step.code)}</div>

                    <div class="key-point">
                        💡 ${step.notes}
                    </div>
                </div>
            `;

        container.innerHTML = html;

        document.getElementById('prevBtn').disabled = stepIndex === 0;
        document.getElementById('nextBtn').disabled = stepIndex === steps.length - 1;
    }

    function changeStep(direction) {
        currentStep += direction;
        if (currentStep < 0) currentStep = 0;
        if (currentStep >= steps.length) currentStep = steps.length - 1;
        renderStep(currentStep);
    }

    function escapeHtml(text) {
        return text.replace(/</g, '&lt;').replace(/>/g, '&gt;');
    }

    function toggleCode() {
        const codeBlock = document.getElementById("codeBlock");
        const button = document.getElementById("toggleBtn");

        codeBlock.classList.toggle("hidden");

        if (codeBlock.classList.contains("hidden")) {
            button.innerText = "👁 Show Code";
        } else {
            button.innerText = "👁 Hide Code";
        }
    }

    renderStep(0);
</script>
</body>
</html>