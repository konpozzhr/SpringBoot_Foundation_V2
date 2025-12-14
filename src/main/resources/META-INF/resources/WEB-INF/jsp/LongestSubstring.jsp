<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="true" %>
<%@ page import="java.util.HashSet" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sliding Window Explanation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 1400px;
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
        .code-block {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 20px;
            border-radius: 8px;
            overflow-x: auto;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            margin: 15px 0;
            line-height: 1.6;
        }
        .keyword {
            color: #ff79c6;
        }
        .string {
            color: #f1fa8c;
        }
        .comment {
            color: #6272a4;
        }
        .highlight {
            background: #fffacd;
            padding: 2px 5px;
            border-radius: 3px;
            font-weight: bold;
        }
        .visual {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border: 2px solid #667eea;
        }
        .string-display {
            font-family: monospace;
            font-size: 24px;
            text-align: center;
            margin: 20px 0;
            letter-spacing: 8px;
        }
        .char-box {
            display: inline-block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            margin: 2px;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-weight: bold;
        }
        .window {
            background: #4caf50;
            color: white;
            border-color: #4caf50;
        }
        .duplicate {
            background: #ff6b6b;
            color: white;
            border-color: #ff6b6b;
        }
        .pointer {
            font-size: 20px;
            font-weight: bold;
        }
        .pointer-a {
            color: #2196f3;
        }
        .pointer-b {
            color: #ff9800;
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
            padding: 12px 24px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #667eea;
            color: white;
        }
        tr:hover {
            background: #f5f5f5;
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
    <h1>🎯 Longest Substring Without Repeating Characters</h1>
    <p class="subtitle">Using the Sliding Window Technique</p>

    <div class="problem">
        <h3>📝 The Problem</h3>
        <p><strong>Given a string, find the length of the longest substring without repeating characters.</strong></p>
        <div style="margin-top: 15px;">
            <strong>Example 1:</strong> "abcabcbb" → Answer: 3 ("abc")<br>
            <strong>Example 2:</strong> "bbbbb" → Answer: 1 ("b")<br>
            <strong>Example 3:</strong> "pwwkew" → Answer: 3 ("wke")
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
            import java.util.HashSet;

            class Solution {

                public int lengthOfLongestSubstring(String s) {

                    int aPointer = 0;
                    int bPointer = 0;
                    int maxLength = 0;

                    HashSet&lt;Character&gt; hashSet = new HashSet&lt;&gt;();

                    while (bPointer &lt; s.length()) {

                        char currentChar = s.charAt(bPointer);

                        if (!hashSet.contains(currentChar)) {
                            hashSet.add(currentChar);
                            bPointer++;
                            maxLength = Math.max(maxLength, hashSet.size());
                        } else {
                            hashSet.remove(s.charAt(aPointer));
                            aPointer++;
                        }
                    }

                    return maxLength;
                }
            }
        </code></pre>
    </div>



    <div class="section">
        <h2>🎨 The Algorithm: Sliding Window</h2>
        <p>Think of it like this: Imagine you have a window that slides across the string. The window expands when you see new characters and shrinks when you hit a duplicate.</p>

        <div class="key-point">
            <strong>🔑 Core Idea:</strong> Use two pointers (a_pointer and b_pointer) to create a "window". The window contains only unique characters. When you find a duplicate, shrink the window from the left until the duplicate is removed.
        </div>

        <div class="visual">
            <h4 style="text-align: center; color: #667eea;">Visual Representation</h4>
            <div style="text-align: center; margin: 20px 0;">
                <div style="display: inline-block; text-align: left;">
                    <div><span class="pointer pointer-a">a_pointer</span> = left side of window (start)</div>
                    <div><span class="pointer pointer-b">b_pointer</span> = right side of window (current position)</div>
                    <div style="margin-top: 10px;">
                        <span style="display: inline-block; width: 20px; height: 20px; background: #4caf50; margin-right: 5px;"></span> = Current valid window<br>
                        <span style="display: inline-block; width: 20px; height: 20px; background: #ff6b6b; margin-right: 5px;"></span> = Duplicate found!
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="section">
        <h2>📋 Step-by-Step Breakdown</h2>

        <div class="step">
            <h3>Step 1: Initialize Variables</h3>
            <div class="code-block">int a_pointer = 0;  <span class="comment">// Left side of window</span>
                int b_pointer = 0;  <span class="comment">// Right side of window (current position)</span>
                int max = 0;        <span class="comment">// Stores the maximum length found</span>

                HashSet&lt;Character&gt; hash_set = new HashSet&lt;&gt;();  <span class="comment">// Tracks unique characters in window</span></div>
            <p><strong>What's happening:</strong> We're setting up our tools. The hash_set will tell us instantly if we've seen a character before.</p>
        </div>

        <div class="step">
            <h3>Step 2: Main Loop - Expand Window with b_pointer</h3>
            <div class="code-block">while(b_pointer &lt; s.length()) {
                <span class="comment">// We'll check each character one by one</span>
                }</div>
            <p><strong>What's happening:</strong> b_pointer scans through the string from left to right, trying to expand our window.</p>
        </div>

        <div class="step">
            <h3>Step 3: Check for Duplicates</h3>
            <div class="code-block">if(!hash_set.contains(s.charAt(b_pointer))) {
                <span class="comment">// Character is NEW! We can expand the window</span>
                hash_set.add(s.charAt(b_pointer));
                b_pointer++;
                max = Math.max(hash_set.size(), max);
                }</div>
            <p><strong>What's happening:</strong></p>
            <ul>
                <li>If the character is NOT in our set → it's unique!</li>
                <li>Add it to the set</li>
                <li>Move b_pointer forward</li>
                <li>Update max if current window is bigger</li>
            </ul>
        </div>

        <div class="step">
            <h3>Step 4: Handle Duplicates - Shrink Window</h3>
            <div class="code-block">else {
                <span class="comment">// DUPLICATE found! Shrink window from left</span>
                hash_set.remove(s.charAt(a_pointer));
                a_pointer++;
                }</div>
            <p><strong>What's happening:</strong></p>
            <ul>
                <li>If the character IS in our set → we have a duplicate!</li>
                <li>Remove the leftmost character from the set</li>
                <li>Move a_pointer forward (shrink the window from left)</li>
                <li>Keep shrinking until the duplicate is gone</li>
            </ul>
        </div>

        <div class="step">
            <h3>Step 5: Return the Result</h3>
            <div class="code-block">return max;</div>
            <p><strong>What's happening:</strong> After scanning the entire string, max contains the length of the longest substring without repeating characters.</p>
        </div>
    </div>

    <div id="walkthrough" class="section">
        <h2>🚶 Interactive Walkthrough</h2>
        <p><strong>Example: "abcabcbb"</strong></p>
        <div id="stepContent"></div>
        <div class="nav-buttons">
            <button class="btn" id="prevBtn" onclick="changeStep(-1)">← Previous</button>
            <button class="btn" id="nextBtn" onclick="changeStep(1)">Next →</button>
        </div>
    </div>

    <div class="section">
        <h2>💡 Why This Works</h2>
        <div class="key-point">
            <strong>The Magic:</strong> By using a HashSet, we can check if a character exists in O(1) time. The two-pointer technique ensures we check each character at most twice (once when expanding, once when shrinking), giving us an efficient O(n) solution!
        </div>

        <h3>Complexity Analysis:</h3>
        <table>
            <tr>
                <th>Aspect</th>
                <th>Complexity</th>
                <th>Explanation</th>
            </tr>
            <tr>
                <td>Time</td>
                <td>O(n)</td>
                <td>Each character visited at most twice (by b_pointer and a_pointer)</td>
            </tr>
            <tr>
                <td>Space</td>
                <td>O(min(n, m))</td>
                <td>HashSet stores unique characters. At most n characters or m (alphabet size)</td>
            </tr>
        </table>
    </div>

    <div class="section">
        <h2>🧪 Test Cases</h2>
        <table>
            <tr>
                <th>Input</th>
                <th>Output</th>
                <th>Explanation</th>
            </tr>
            <tr>
                <td>"abcabcbb"</td>
                <td>3</td>
                <td>Longest substring is "abc"</td>
            </tr>
            <tr>
                <td>"bbbbb"</td>
                <td>1</td>
                <td>All characters are same, so "b"</td>
            </tr>
            <tr>
                <td>"pwwkew"</td>
                <td>3</td>
                <td>Longest is "wke"</td>
            </tr>
            <tr>
                <td>""</td>
                <td>0</td>
                <td>Empty string</td>
            </tr>
            <tr>
                <td>"au"</td>
                <td>2</td>
                <td>Entire string is unique</td>
            </tr>
            <tr>
                <td>"dvdf"</td>
                <td>3</td>
                <td>Longest is "vdf"</td>
            </tr>
        </table>
    </div>

    <div class="section">
        <h2>🎓 Key Takeaways</h2>
        <ul style="line-height: 2;">
            <li><strong>Sliding Window:</strong> A powerful technique for substring/subarray problems</li>
            <li><strong>Two Pointers:</strong> One expands (b_pointer), one contracts (a_pointer)</li>
            <li><strong>HashSet:</strong> Perfect for tracking unique elements with O(1) lookup</li>
            <li><strong>When to shrink:</strong> Only when you encounter a duplicate</li>
            <li><strong>Track maximum:</strong> Update max whenever the window is valid</li>
        </ul>
    </div>
</div>

<script>
    const steps = [
        {
            iteration: 0,
            string: "abcabcbb",
            a: 0, b: 0,
            set: [],
            max: 0,
            action: "Start: Both pointers at position 0",
            explanation: "We begin with empty window and empty set"
        },
        {
            iteration: 1,
            string: "abcabcbb",
            a: 0, b: 1,
            set: ['a'],
            max: 1,
            action: "Add 'a': No duplicate, expand window",
            explanation: "'a' is new. Add to set, move b_pointer forward, update max=1"
        },
        {
            iteration: 2,
            string: "abcabcbb",
            a: 0, b: 2,
            set: ['a', 'b'],
            max: 2,
            action: "Add 'b': No duplicate, expand window",
            explanation: "'b' is new. Add to set, move b_pointer forward, update max=2"
        },
        {
            iteration: 3,
            string: "abcabcbb",
            a: 0, b: 3,
            set: ['a', 'b', 'c'],
            max: 3,
            action: "Add 'c': No duplicate, expand window",
            explanation: "'c' is new. Add to set, move b_pointer forward, update max=3"
        },
        {
            iteration: 4,
            string: "abcabcbb",
            a: 1, b: 3,
            set: ['b', 'c'],
            max: 3,
            action: "Found 'a' again! Remove first 'a', shrink window",
            explanation: "'a' already exists! Remove leftmost 'a', move a_pointer forward"
        },
        {
            iteration: 5,
            string: "abcabcbb",
            a: 1, b: 4,
            set: ['b', 'c', 'a'],
            max: 3,
            action: "Now 'a' is unique, add it",
            explanation: "After removing duplicate, 'a' is unique again. Add and expand"
        },
        {
            iteration: 6,
            string: "abcabcbb",
            a: 2, b: 4,
            set: ['c', 'a'],
            max: 3,
            action: "Found 'b' again! Remove first 'b'",
            explanation: "'b' is duplicate. Shrink window from left"
        },
        {
            iteration: 7,
            string: "abcabcbb",
            a: 2, b: 5,
            set: ['c', 'a', 'b'],
            max: 3,
            action: "Add 'b' after removing duplicate",
            explanation: "Now 'b' is unique in current window"
        },
        {
            iteration: 8,
            string: "abcabcbb",
            a: 3, b: 5,
            set: ['a', 'b'],
            max: 3,
            action: "Found 'c' again! Remove it",
            explanation: "Keep shrinking until duplicate is removed"
        },
        {
            iteration: 9,
            string: "abcabcbb",
            a: 3, b: 6,
            set: ['a', 'b', 'c'],
            max: 3,
            action: "Add 'c' and continue",
            explanation: "Window is valid again with unique characters"
        },
        {
            iteration: 10,
            string: "abcabcbb",
            a: 5, b: 6,
            set: ['c'],
            max: 3,
            action: "Remove duplicates: 'a' then 'b'",
            explanation: "Found 'b' again, shrinking window multiple times"
        },
        {
            iteration: 11,
            string: "abcabcbb",
            a: 5, b: 7,
            set: ['c', 'b'],
            max: 3,
            action: "Add second-to-last 'b'",
            explanation: "Continue scanning..."
        },
        {
            iteration: 12,
            string: "abcabcbb",
            a: 7, b: 7,
            set: ['b'],
            max: 3,
            action: "Remove duplicate 'b', keep last 'b'",
            explanation: "Almost done..."
        },
        {
            iteration: 13,
            string: "abcabcbb",
            a: 7, b: 8,
            set: ['b'],
            max: 3,
            action: "Reached end of string",
            explanation: "Final answer: max = 3 (substring 'abc')"
        }
    ];

    let currentStep = 0;

    function renderStep(index) {
        const step = steps[index];
        const container = document.getElementById('stepContent');

        let stringDisplay = '';
        for (let i = 0; i < step.string.length; i++) {
            let className = 'char-box';
            if (i >= step.a && i < step.b) {
                className += ' window';
            }
            stringDisplay += `<span class="${className}">${step.string[i]}</span>`;
        }

        let html = `
                <div class="visual">
                    <h4 style="color: #667eea;">Iteration ${step.iteration}</h4>
                    <div class="string-display">${stringDisplay}</div>
                    <div style="text-align: center; margin: 20px 0;">
                        <div><span class="pointer pointer-a">a_pointer</span> = ${step.a}</div>
                        <div><span class="pointer pointer-b">b_pointer</span> = ${step.b}</div>
                        <div style="margin-top: 10px;"><strong>Set:</strong> {${step.set.join(', ')}}</div>
                        <div><strong>Max:</strong> ${step.max}</div>
                    </div>
                    <div style="background: #f0f4ff; padding: 15px; border-radius: 8px; margin-top: 15px;">
                        <strong style="color: #667eea;">Action:</strong> ${step.action}<br>
                        <strong style="color: #764ba2;">Explanation:</strong> ${step.explanation}
                    </div>
                </div>
            `;

        container.innerHTML = html;

        document.getElementById('prevBtn').disabled = index === 0;
        document.getElementById('nextBtn').disabled = index === steps.length - 1;
    }

    function changeStep(direction) {
        currentStep += direction;
        if (currentStep < 0) currentStep = 0;
        if (currentStep >= steps.length) currentStep = steps.length - 1;
        renderStep(currentStep);
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