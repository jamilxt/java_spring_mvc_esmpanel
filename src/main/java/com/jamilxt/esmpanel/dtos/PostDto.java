package com.jamilxt.esmpanel.dtos;

import java.util.List;

public class PostDto {
    List<String> images;
    String caption;

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }
}
