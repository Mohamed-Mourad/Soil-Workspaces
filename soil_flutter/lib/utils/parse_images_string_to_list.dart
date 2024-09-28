List<String> parseImages(String images) {
  return images.split(' - ').map((image) => image.trim()).toList();
}