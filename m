Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57AAE164D20
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2020 18:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBSR5b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Feb 2020 12:57:31 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51380 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgBSR5b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 12:57:31 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so1679589wmi.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 09:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=KHboEJQ4V7KnKKRwo21hWQi19tJ6wvBUxs3FLeRZPmM=;
        b=NubdAZU+sSIbz0BV0mDakLLuTLcEqspzE4Up1DQtkWIpdW1mpgNM1v8RJ8ZZuhKvJi
         MWbF+35NEjHnzip03/uJuENbfIAdHWuamF8c69nFYf8zV/oVGHqSUZ630Fswm4XC1dXz
         5YvgY7LY2WqHCTIKhYcdwQ+R6HX4cffTVm3cfpYzg4Eu5XyaxWurXKwAMWFatKDl7RdO
         PwF98nY3P7BdedA9YhLoKZf9L8cjS/aJl3c0DkPJ45wMIxscmqwbW4Gqu5RHDGZJzlOH
         3ErQZHlJgoTkUGCUcLd9fsGwG4X59w8oZIXhFIykIQMVOmotCRQ/36uQA3DJfB4uT2nw
         EGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=KHboEJQ4V7KnKKRwo21hWQi19tJ6wvBUxs3FLeRZPmM=;
        b=HmhZNasv7DoV20/jEjP4jLM0RuTUc3lcGBwme+ZAFW/YsW+mo8cT9V/OGGqmslOoiy
         KrkKG1JSAUi+yGNVoX/zME481aOONaYS6OUP3nGLjDVt8Cx7qDf42KX8xAqPFL5st7ml
         egpm9H2EiA+aMep0gt+CZ7rXd+9iL+5Cb5rEPQupS2GYw+Mds5AaButuZXiNHkhGwyIE
         GXU9OOp8SchJq7K/l1y90jaBvx3OBBeSyI0cfYxEVEEX90MzuRCgDVzDE3XpK+QU5eJu
         uXIVbnAWbRlktp8rfIn00EEN8kg+fQw3DpMfJmU09qIWECMNO10EdFMCESpOwgEF5PGI
         uHpg==
X-Gm-Message-State: APjAAAV0ria07o5JYGgEq0R8kFLkTvY+aLNtN3oG53L0y6DqcAFawKeH
        15H3Un/pJfNJEGz4H9RPlFucvg==
X-Google-Smtp-Source: APXvYqzbs/Rr0atG2jUBRF7oE+i6F0iHSH+QTqV8GivqqqY0OmLGz1cSkAVCbjhN3skyuX9vVMLI2A==
X-Received: by 2002:a05:600c:2207:: with SMTP id z7mr10879867wml.167.1582135048910;
        Wed, 19 Feb 2020 09:57:28 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id f8sm771899wru.12.2020.02.19.09.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 09:57:28 -0800 (PST)
References: <20200219084928.28707-1-narmstrong@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: meson: g12a: add support for the SPICC SCLK Source clocks
In-reply-to: <20200219084928.28707-1-narmstrong@baylibre.com>
Date:   Wed, 19 Feb 2020 18:57:27 +0100
Message-ID: <1jy2sywjco.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 19 Feb 2020 at 09:49, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Like on the AXG SoCs, the SPICC controllers can make use of an external clock
> source instead of it's internal divider over xtal to provide a better SCLK
> clock frequency.
>
> This serie adds the new clock IDs and the associated clocks in the g12a driver.
>
> Neil Armstrong (2):
>   dt-bindings: clk: g12a-clkc: add SPICC SCLK Source clock IDs
>   clk: meson: g12a: add support for the SPICC SCLK Source clocks
>
>  drivers/clk/meson/g12a.c              | 129 ++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |   6 +-
>  include/dt-bindings/clock/g12a-clkc.h |   2 +
>  3 files changed, 136 insertions(+), 1 deletion(-)

Applied. Thx
