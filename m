Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD5421952E2
	for <lists+linux-clk@lfdr.de>; Fri, 27 Mar 2020 09:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgC0Ib7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Mar 2020 04:31:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37801 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0Ib6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Mar 2020 04:31:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id d1so11346794wmb.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2020 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/8e1khbt3xy4ZUf34DU6Fxze93y8M47+3udr0iQSRsI=;
        b=LHWAWHzmrgJi6sjgnjoGfbv7/nunVx19vgyHo/Iys+J47ldqjn8fGNWukWARkju+5I
         vxbxj1NSvZ3VbfxweyHPqh6Dl1Ho/ppvvxSzYAun432P1qgCZD6dOCKJFmKI6uwd6wc0
         o5bjDLooHalwWV9R8YtQ62qyeotsUIkiZl85Z4bpwT5LcRPhRZZXVI8vDevR0jT6RL/A
         dNFry0CzpNV4ae7f5kjFirmvM+Lw7yrn81OFB0G15fzV2kHfMmi9DVpiOd4BQsfTBM74
         jIUN9CTbrlLpgMk3oecrzVR0NLzrIAKFVi7HJ2Yuxpy5IyW5hHCabCi2m9dSFDAUUPsP
         N1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/8e1khbt3xy4ZUf34DU6Fxze93y8M47+3udr0iQSRsI=;
        b=qiE3w9bRLsIoFvi+5Gz4YDynNK/Daw3kqhA0sWMFBodTNlVk1yLM4ZaaAN4kAXqXdY
         ZU7+mw0OBuxaH5d4A/QaI6CSXh5ujrCvuUoCCJJSO1uKpIpCSrqW7VOo4Z3cXHvI9Hza
         0HgDD8tRe9THXx0C88SJVl9WRbteuaivW/2KCZAUg7KUlqTQEAsgAouCNhSSkwH6rDek
         NFFUD8JjtuE/oZWvev61FKaf4HM91B97OzAzxtwC5oyIebyo4Zn0caH9f44Awwb+DIMh
         DDQFSCUD85cBA3gW9ex7ZItTDz9MdK2FCPFzNP64B+z4KTyu4Hmc6IFuPJE/TGr68g/d
         TC2w==
X-Gm-Message-State: ANhLgQ1WmO1DcKFyCArgz6DdGqtr7UlzydfCRPeKaLOVqhmctiP/MWwq
        yTugyjZNTrqQ8Izbqq/8AVZMxQ==
X-Google-Smtp-Source: ADFU+vshlFLkzjFGLqZWToyKEwofbRxD/jsH8lC+uHzFVX7qI4umf//ndsbal5w8KkGL0SIvWV2zCg==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr4129403wma.158.1585297917089;
        Fri, 27 Mar 2020 01:31:57 -0700 (PDT)
Received: from dell ([95.149.164.95])
        by smtp.gmail.com with ESMTPSA id w67sm7008731wmb.41.2020.03.27.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 01:31:56 -0700 (PDT)
Date:   Fri, 27 Mar 2020 08:32:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Zhang Rui <rui.zhang@intel.com>,
        dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
Message-ID: <20200327083246.GJ603801@dell>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-4-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 25 Mar 2020, Rob Herring wrote:

> Numerous schemas are missing 'additionalProperties: false' statements which
> ensures a binding doesn't have any extra undocumented properties or child
> nodes. Fixing this reveals various missing properties, so let's fix all
> those occurrences.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Guillaume La Roque <glaroque@baylibre.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/fsl,plldig.yaml |  3 +++
>  .../gpio/socionext,uniphier-gpio.yaml         |  2 ++
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  6 ++---
>  .../bindings/gpu/arm,mali-midgard.yaml        |  3 +++
>  .../bindings/iio/adc/adi,ad7192.yaml          |  1 -
>  .../bindings/iio/pressure/bmp085.yaml         |  3 +++
>  .../media/amlogic,meson-gx-ao-cec.yaml        |  9 +++++---

>  .../bindings/mfd/rohm,bd71828-pmic.yaml       |  3 +++

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
