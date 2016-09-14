#include "b.hpp"

#include "a.hpp"

namespace b {
  void hello() { a::hello(); }
}
