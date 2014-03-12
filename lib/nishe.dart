library nishe;

import 'dart:collection';

class Partition {
  final Map _images;

  Partition._internal(this._images);

  Partition(List<List> partition): this._internal(_partitionToImages(partition)
      );

  static Map _partitionToImages(List<List> partition) {
    var domain = new List();
    for (var cell in partition) {
      if (cell.length == 0) {
        throw new ArgumentError("cells must have length > 0");
      }
      for (var x in cell) {
        if (domain.contains(x)) {
          throw new ArgumentError("the element $x was seen more than once");
        }
        domain.add(x);
      }
    }
    domain.sort();
    var images = new Map();
    int index = 0;
    for (var cell in partition) {
      for (var x in cell) {
        images[x] = domain[index];
      }
      index += cell.length;
    }
    return images;
  }

  image(x) => _images[x];
  Set get domain {
    var domain = new SplayTreeSet()..addAll(_images.keys);
    return domain;
  }
}
