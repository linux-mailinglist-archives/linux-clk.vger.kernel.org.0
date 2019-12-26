Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B74EF12AF27
	for <lists+linux-clk@lfdr.de>; Thu, 26 Dec 2019 23:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfLZWXb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 26 Dec 2019 17:23:31 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34744 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfLZWXb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Dec 2019 17:23:31 -0500
Received: by mail-pf1-f193.google.com with SMTP id i6so6964193pfc.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2019 14:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Sprza847Fg3Wz4gx8X0Ya4BdhvQ1Fb4mpkG/Xj/3FE4=;
        b=h5ghKZ7QvZulvsEfe/dDrD3+cHPYPbwYA06G2rOMtFaM5jznZuvFQTpkDzmk8a44Bu
         4ZdMEnrtCAU2E/pBbmFy/M5psqskyCfEZwvFqNVRp9ltsjmXnfAG3c7E/+NM58iD+JHi
         u6BAqKvesPH+nLdfYGqmdjHpbkWJkaHSnrAiLAa+2nKzxZW9sDnbY83wc96tQ6/ctY9P
         zM4A1AppsJ4LL4a0yUJltMZa7Xe7Oqx9kTIUhMZ8pnzuvM/9ygcD8pKY8yu9BR96eLcv
         kBhWHheUkboln9UwbuKG6Ef4EunKkQCZ+UJDNFPC06DhxN3bjKBGXQHHUnXqV83LHn1H
         861Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sprza847Fg3Wz4gx8X0Ya4BdhvQ1Fb4mpkG/Xj/3FE4=;
        b=PL9jTaKgL6GPPrDwODUeaFHtcqsmttfSzw4xzJcpfWcggspmbVnaJA9rzup1wLcfi0
         dcs7uZafqxBW7ItcVVxj/jqEXKYOxMsX4hNVvckxqxETJ/J6CYGYAdkJGePaHDQQCxEM
         uoomKosK5nU0/yPvLCXdb0Ko5PARnfNAofiGY/3nt6aTTp3Qm+R+nn82VeAJbZeIMG4A
         QEAEY62KIb2chpr+U8bUMBTN0s5hLP6HEKfnegFdSyvf2EJDmz2Y+ZM6GvtwtE04XPWc
         PSQ18qZONAhaeBz2oyK/580mHOyJA8gtifldHqstaBqX1SzDU36FmgvlcIYGy/6IKZVM
         Xycg==
X-Gm-Message-State: APjAAAXSZ8KJz6xYqdNZN/jtT2sgF+7gBSCX5IncTd4BnfhQAJyrpioJ
        ao/py2Bk4FsHDQ1ETh1MrjmPbA==
X-Google-Smtp-Source: APXvYqyCu1goN+OnYdwfkwXryXqj7LcmvuOHhUxkblWrrpql52W39bq2TU9mRFQIpm8+K+MEiVP+tQ==
X-Received: by 2002:a62:5447:: with SMTP id i68mr41980642pfb.44.1577399010364;
        Thu, 26 Dec 2019 14:23:30 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i11sm12282752pjg.0.2019.12.26.14.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 14:23:29 -0800 (PST)
Date:   Thu, 26 Dec 2019 14:23:15 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
Message-ID: <20191226222315.GD1908628@ripper>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
 <20191207203603.2314424-2-bjorn.andersson@linaro.org>
 <20191224024845.445A92070E@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224024845.445A92070E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 23 Dec 18:48 PST 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-12-07 12:36:02)
> > The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
> > SoC. Update the definition of these clocks to allow this to be wired up
> > to the appropriate clock source.
> > 
> > Retain "xo" as the global named parent to make the change a nop in the
> > event that DT doesn't carry the necessary clocks definition.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,gcc.yaml   |  6 ++--
> >  drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++----
> >  2 files changed, 32 insertions(+), 9 deletions(-)
> 
> What is this patch based on? I think I'm missing some sort of 8996 yaml
> gcc binding patch.
> 

The patch applies cleanly on linux-next and afaict it depends on the
yamlification done in 9de7269e9703 ("dt-bindings: clock: Add YAML
schemas for the QCOM GCC clock bindings"), which git tells me is
included in v5.5-rc1 as well.

Am I misunderstanding your question?

Regards,
Bjorn
