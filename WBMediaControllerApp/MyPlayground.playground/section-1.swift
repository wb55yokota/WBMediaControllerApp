// Playground - noun: a place where people can play

import Cocoa

var str = "/hom4/"

str.stringByReplacingOccurrencesOfString("/[^/+]/$", withString:"/", options:NSStringCompareOptions.RegularExpressionSearch, range: nil)

str.stringByReplacingOccurrencesOfString("/[^/]+/$", withString:"/", options:NSStringCompareOptions.RegularExpressionSearch, range: nil)
