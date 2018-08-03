import UIKit

print("hello world!")

var foo: Array<String>?

foo = ["foo", "bar", "tag"];

foo.map {element in
    print(element)
}

let result = foo?.filter({ (str) -> Bool in
    return str == "foo"
})

if let result = result {
    print("has foo \(result)")
} else {
    print("not has foo")
}

var bar = [1, 2, 3, 4, 5]

let bars = bar.map { $0 * $0 }
print(bars)

bar.filter {ele in
    if ele%2 == 0 {
        return true
    } else {
        return false
    }
}
