//
//  [백준 1463] 1로 만들기.swift
//  Algorithm
//
//  Created by 김민 on 2/14/24.
//
// 백준 1463 1로 만들기 https://www.acmicpc.net/problem/1463

/*
[📌 전략] [✅ 풀이]
d[i] = i를 1로 만들기 위해 필요한 연산 횟수의 최솟값

d[i]는
d가 3의 배수이면 d[i/3]에서 +1을 한 값
d가 2의 배수이면 d[i/2]에서 +1을 한 값
d[i-1]에 +1을 한 값
이 3가지가 모두 될 수 있고, 이중 최솟값으로 d[i]를 구하면 된다.
1일 때부터 차례로 d[i]를 채워가면서 d[n]을 구한다.
*/

let n = Int(readLine()!)!
var d = Array(repeating: -1, count: n+1)

for i in 1...n {
    /*
     n의 최댓값이 1000000이고, 연산 횟수의 최대는 1로만 연산하는 것이라 편의상 1000000으로 잡았다.
     나중에 min 값 비교에 사용된다.
     */
    var (d3, d2, d1) = (1000000, 1000000, 1000000)
    if i % 3 == 0 { d3 = d[i/3] + 1 } // 3의 배수이면 d[i/3] + 1
    if i % 2 == 0 { d2 = d[i/2] + 1 } // 2의 배수이면 d[i/2] + 1
    d1 = d[i-1] + 1 // d[i-1] + 1은 모든 값에 해당

    d[i] = min(d3, d2, d1) // 3가지 경우 중 최솟값으로 d[i]를 구한다
}

print(d[n])
