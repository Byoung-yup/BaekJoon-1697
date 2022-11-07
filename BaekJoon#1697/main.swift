//
//  main.swift
//  BaekJoon#1697
//
//  Created by 김병엽 on 2022/11/07.
//
// Reference: https://zest1923.tistory.com/m/91

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var visited = Array(repeating: false, count: 100001)
var depth = Array(repeating: 0, count: 100001)
var queue = [input[0]]
var idx = 0
visited[input[0]] = true

while idx < queue.count {
    let node = queue[idx]
    idx += 1
    if node == input[1] { break }
    
    for i in 0..<3 {
        var next: Int
        if i == 0 { next = node - 1}
        else if i == 1 { next = node + 1 }
        else { next = node * 2 }
        
        if valid(n: next) {
            queue.append(next)
            depth[next] = depth[node] + 1
            visited[next].toggle()
        }
    }
}

print(depth[input[1]])

func valid(n: Int) -> Bool {
    if n < 0 || n > 100000 || visited[n] {
        return false
    } else {
        return true
    }
}
