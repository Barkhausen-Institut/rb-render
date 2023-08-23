use magnus::{embed, eval, symbol::IntoSymbol, RHash, RString};


pub fn init() -> embed::Cleanup {
    unsafe { embed::init() }
}

pub fn render_hello_world() -> String {
    let val:String = eval!("
require \"../../ruby/render\"

render_text \"Hello World\"
   ").unwrap();
    val
}

pub fn render_hello_world_file() -> String {
    let val:String = eval!("
require \"../../ruby/render\"

render_file \"../../ruby/hello_world_file.erb\"
   ").unwrap();
    val
}

pub fn render_file(loc:&str, erb:&str, args:RHash) -> String {
    let val:String = eval!("
require \"../../ruby/render\"

render_erb_file(l, e, a)
   ", l=loc, e=erb, a = args).unwrap();
    val
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let _ruby = init();

        let rendered = render_hello_world();
        assert_eq!(rendered, "Hello World");

        let rendered = render_hello_world_file();
        assert_eq!(rendered, "Hello World File\n");

        let args = RHash::new();
        args.aset("word".into_symbol(), RString::new("World")).unwrap();
        let rendered = render_file("../../ruby", "hello", args);
        assert_eq!(rendered, "Hello World\n");
    }
}
