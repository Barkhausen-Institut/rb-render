use magnus::{embed, eval};

pub fn render() -> String {
    let _cleanup = unsafe { embed::init() };
    let val:String = eval!("
require \"../../ruby/render\"

helloworld()
   ").unwrap();
    val
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        println!("before rendering");
        let rendered = render();
        println!("after rendering");
        assert_eq!(rendered, "Hello World");
    }
}
