Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34A2132654
	for <lists+linux-clk@lfdr.de>; Tue,  7 Jan 2020 13:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgAGMgi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Jan 2020 07:36:38 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40626 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbgAGMgg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jan 2020 07:36:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so19192221wmi.5
        for <linux-clk@vger.kernel.org>; Tue, 07 Jan 2020 04:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZigGWyR5dA/rlmY5eQN1DFgU3TyM5dNJj4wuZim4lMg=;
        b=v1vH5ppfwwaQyU0557PdvzkzfgSmt8Qdg6In7lDLwtorTe1YQxwgrSRGTR5HVqP9vs
         vlx8AHphmwSmzv1+rEga+lsE7Vd2hsCizbJj2B4tf8xsJZ7uJuQtemgVOHWPPV0gKk6x
         +vAOeFTOnUCSdvEd17cltbU2Ik5HqO293wNSuEyTaYl8hUuUpRUwWgfR0ci9RMjUTcyd
         oknu0+e6xNYP+Ispe8wDu+NASM46j93S1pyqp7bXmvjBGxs89hAedp2RdiSxBa60Mzm0
         pb+gbmV+0HdEsjBsFQ3LYy7EZeOEYECZ/Y1UWbJ7+ur+0r+VfYvk69jdDmlHRRmP6N7E
         WVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZigGWyR5dA/rlmY5eQN1DFgU3TyM5dNJj4wuZim4lMg=;
        b=V8Wrv8GpCIGw2ic/W59IBJl3Zk+goPXo68ee29Ce0muhixx4+Cxz6DvMnTe/Ge1tPJ
         3ACnrXgCDg7oXO/ocPpd+LRuXH54LtlYvWsaCjhZnWv+4Q15v/1QT7mpfKGTmJJiijWI
         +QCi3yCJimLgG18Ua80/wrBxqAYIlD4O50K8m8z5Xh8ae6+n09kYTUb+vOz61j0GyGuH
         NZ5blWrTaJEBCppt95e112lInuoUbUA8N639xA50N+x1p3aibfv6YzOqZ76Ugjbbe+1D
         vFWFM8vbMpK0CqKumGILMmwouFtUN71d44b10aiQxBuN98H6opGecjXeHwwGf2UZZ3VG
         /lDA==
X-Gm-Message-State: APjAAAUkZ1cF+eoHEY2zfE4bAi8mtlCmLJb8dk0jJktk9o09JukjRgij
        5jia8VIf6Iy6LMDN8y5R3tOYzA==
X-Google-Smtp-Source: APXvYqx8hyPUO/+s6KqblUDY9P6qWopaZFPmK+OaNZfoX/P2gCtwCPDOS87mnKX8JiJIT/d3LpZ01g==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr40496323wmg.110.1578400594309;
        Tue, 07 Jan 2020 04:36:34 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id e18sm76983844wrw.70.2020.01.07.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 04:36:33 -0800 (PST)
Date:   Tue, 7 Jan 2020 12:36:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 04/12] mfd: bd718x7: Add compatible for BD71850
Message-ID: <20200107123647.GH14821@dell>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <bd5009357c16d73d9bad52be68db74a2cfa6328f.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd5009357c16d73d9bad52be68db74a2cfa6328f.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 30 Dec 2019, Matti Vaittinen wrote:

> ROHM BD71850 PMIC is almost identical to BD71847. Main difference is some
> initial voltage values for regulators. The BD71850 can be handled by
> BD71847 driver but adding own compatible makes it clearer for one who
> creates the DT for board containing this PMIC and allows SW to be
> differentiating PMICs if needed.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v7 - no changes
> 
>  drivers/mfd/rohm-bd718x7.c | 4 ++++
>  1 file changed, 4 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
