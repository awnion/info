# Rust `tokio::select!`

🦀 95% of Rustaceans do this wrong 😭

The first problem is the most obvious one:

```rust
tokio::spawn(... // -- is not handled
```

Which is bad of course, but it's on the surface.

Ok, let's handle it:

```rust
let handle = tokio::spawn(async { /* ... */ });
```

Now we have a problem, since we have an infinite loop at the end of the main function, and we need to await our "handle". Where do you put the `handle.await`?

Here most Rustaceans

[ ] either **give up** and keep tokio subroutine just **unhandled** (which will sooner or later lead to disaster)

[*] or use mpsc channel (which is fine most of the time, but a bit too verbose).

There are multiple solutions. Most of the time tokio::select! {} will be enough. Because you can race your coroutines without introducing extra complexity with channels. While you can handle both: join error from the join handle and actual error from inside the coroutine in the same place with just a double question mark "??".

## What are you waiting for? Go and play with the code 🧑‍💻

- ❌ <https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=62019a47383972486ba92c14ac1e0ac6>

```rust
use std::time::Duration;

use tokio::time::sleep;

// this will stack in inconsistent infinite loop

#[tokio::main]
async fn main() {
    tokio::spawn(async {
        println!("control path (worker)");
        for i in (0..5).rev() {
            println!("(worker) ...{i}");
            sleep(Duration::from_millis(1000)).await;
        }
        panic!("(worker) BOOOOOOOOOOOOOM!!!!");
    });

    // THIS IS BAD: main control path should be just a manager
    // since child workload should be handled
    println!("control path (main)");
    loop {
        sleep(Duration::from_millis(222)).await;
        println!("(main)");
    }
}
```

- ✅ <https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=e6b4fb8b53e62898369a2524547a43b5>

```rust
use std::time::Duration;

use tokio::time::sleep;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let control_path_1 = tokio::spawn(async {
        println!("control path (path_1)");
        for i in (0..5).rev() {
            println!("(path_1) ...{i}");
            sleep(Duration::from_millis(1000)).await;
        }
        panic!("(path_1) BOOOOOOOOOOOOOM!!!!");
    });

    let control_path_2 = tokio::spawn(async {
        println!("control path (path_2)");
        loop {
            sleep(Duration::from_millis(222)).await;
            println!("(path_2)");
        }
    });

    tokio::select! { // as a bonus you get error handling with _?_
        v = control_path_1 => v?,
        v = control_path_2 => v?,
    }
}
```

> #rust #rustlang #tokio #async

## Links

[Original post](https://www.linkedin.com/posts/awnion_rust-rustlang-tokio-activity-7230298186618159106-KN84?utm_source=share&utm_medium=member_desktop)
