import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

const int rows = 20;
const int cols = 20;
const int tileSize = 20;

class SnakeGame extends StatefulWidget {
  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  late List<List<int>> grid;
  late List<int> snake;
  late List<int> food;
  late String direction;
  late bool isPlaying;
  late bool gameOver;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void initializeGame() {
    grid = List.generate(rows, (i) => List.generate(cols, (j) => 0));
    snake = [rows ~/ 2, cols ~/ 2];
    food = [Random().nextInt(rows), Random().nextInt(cols)];
    grid[food[0]][food[1]] = 1;
    direction = 'right';
    isPlaying = true;
    gameOver = false;
    timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (isPlaying) {
        moveSnake();
        setState(() {}); // Update UI after each movement
      }
    });
  }

  void moveSnake() {
   switch (direction) {
  case 'up':
    snake.insert(0, snake[0] - 1); // Add new segment above the head
    snake.insert(0, snake[1]); // Add new segment to the head (x coordinate)
    break;
  case 'down':
    snake.insert(0, snake[0] + 1); // Add new segment below the head
    snake.insert(0, snake[1]); // Add new segment to the head (x coordinate)
    break;
  case 'left':
    snake.insert(0, snake[0]); // Add new segment to the head (y coordinate)
    snake.insert(0, snake[1] - 1); // Add new segment to the left of the head
    break;
  case 'right':
    snake.insert(0, snake[0]); // Add new segment to the head (y coordinate)
    snake.insert(0, snake[1] + 1); // Add new segment to the right of the head
    break;
}

    if (snake[0] < 0 ||
        snake[0] >= rows ||
        snake[1] < 0 ||
        snake[1] >= cols) {
      gameOver = true;
      isPlaying = false;
      timer.cancel();
    } else if (snake[0] == food[0] && snake[1] == food[1]) {
      // Snake eats food
     snake.insert(0, food[1] + 1); // Add new segment to snake's head (x coordinate)
     snake.insert(0, food[0]); // Add new segment to snake's head (y coordinate) // Add new segment to snake's head (y coordinate)
      generateFood();
    } else {
      snake.removeLast(); // Remove the tail segment if no food was eaten
    }

    for (int i = 0; i < snake.length - 1; i += 2) {
      if (snake[i] == snake.last && snake[i + 1] == snake[snake.length - 1]) {
        gameOver = true;
        isPlaying = false;
        timer.cancel();
        break;
      }
    }

    if (!gameOver) {
      setState(() {
        grid = List.generate(rows, (i) => List.generate(cols, (j) => 0));
        for (int i = 0; i < snake.length - 1; i += 2) {
          grid[snake[i]][snake[i + 1]] = 2;
        }
        grid[food[0]][food[1]] = 1;
      });
    }
  }

  void generateFood() {
    food = [Random().nextInt(rows), Random().nextInt(cols)];
    if (snake.contains(food[0]) && snake.contains(food[1])) {
      generateFood();
    }
  }

  void handleKeyPress(String newDirection) {
    if (isPlaying) {
      direction = newDirection;
    }
  }

  void restartGame() {
    setState(() {
      initializeGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: cols * tileSize.toDouble(),
            height: rows * tileSize.toDouble(),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: rows * cols,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
              ),
              itemBuilder: (BuildContext context, int index) {
                final int row = index ~/ cols;
                final int col = index % cols;
                Color color;
                if (grid[row][col] == 2) {
                  color = Colors.green;
                } else if (grid[row][col] == 1) {
                  color = Colors.red;
                } else {
                  color = Colors.white;
                }
                return Container(
                  color: color,
                  margin: EdgeInsets.all(1),
                );
              },
            ),
          ),
          if (gameOver)
            Text(
              'Game Over',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          if (gameOver)
            ElevatedButton(
              onPressed: () => restartGame(),
              child: Text('Restart'),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.keyboard_arrow_up),
                onPressed: () => handleKeyPress('up'),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left),
                onPressed: () => handleKeyPress('left'),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () => handleKeyPress('right'),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () => handleKeyPress('down'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
