Ac 
=[         0         0  0.501592  0.985923  0.167197         0         0         0         0      0;
        0         0   2.95777 -0.167197  0.985923         0         0         0         0         0;
        0         0         0         0         0         1         0         0         0         0;
        0         0         0  -1.72911         0         0         0         1        -0         0;
        0         0         0        -0  -146.013    22.034         0         0         0         0;
        0         0         0         0   80.7608  -13.8464         0         0         0         0;
        0         0         0         0         0         0         0         0         0         1;
        0         0         0         0         0         0         0         0         0         0;
        0         0         0         0         0         0         0         0         0         0;
        0         0         0         0         0         0         0         0         0         0]
Bc 
=[ 0 0 0;
0 0 0;
0 0 0;
0 0 0;
0 0 0;
0 0 0;
0 0 0;
1 0 0;
0 1 0;
0 0 1
];

% 제어 가능 행렬 생성 및 랭크 계산
Ctrb = ctrb(A, B);
rankCtrb = rank(Ctrb);

% 제어 가능성 확인
if rankCtrb == size(A, 1)
    disp('The system is controllable.');
else
    disp('The system is not controllable.');
end

% 출력 행렬 C 정의 (모든 상태 측정 가능 가정)
C = eye(size(A));

% 관측 가능 행렬 생성 및 랭크 계산
Obsv = obsv(A, C);
rankObsv = rank(Obsv);

% 관측 가능성 확인
if rankObsv == size(A, 1)
    disp('The system is observable.');
else
    disp('The system is not observable.');
end