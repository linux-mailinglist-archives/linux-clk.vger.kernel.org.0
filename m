Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA12C1D8456
	for <lists+linux-clk@lfdr.de>; Mon, 18 May 2020 20:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgERSLU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 18 May 2020 14:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732848AbgERSEt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 May 2020 14:04:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C7DC05BD0B
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 11:04:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 5so196667pjd.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nGHpGwwWCzCJVc7bPHElzmAcZWD6x2usMfgTF/Hyv34=;
        b=yezs7gGmWNEMQgES7TZ+xcCNcGDm2+5zFxorxpSP+ZD8d645MzsEgn/+ELaoNKXIFF
         jwt25o2C1yM1vnTI6Hq0qT4rrZeh8aZYdo99QBYcXaJAED8NNz97cHQPfyanqByvOh8p
         q2P6P9PgOakAS2y/R7ywxQeQLTluzvw4DRj7LTbweDTceoXUwix5YjtjzbpIgwZhWacL
         u0kJHWnongsmlnxe9x81xW8PMi4x3cfmmaFf76hlMYAh3p7i/SevDZdLWIdwtV+XIvZo
         HsJG3QBKDPJKTLwyqp0nSxh4qC5QRhrQ6MTB5zCV25Y/P42K/Yk+kupocFQObxdpjLwh
         mzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nGHpGwwWCzCJVc7bPHElzmAcZWD6x2usMfgTF/Hyv34=;
        b=MlqepefbOZc9DseKt2Tt4FAhzeLDju9vhSY6LJhEBb4YW360LPLOGIp/iau/zL1M26
         X/ZnSPgKPpmr68u0I8yh985UDlOtUhEHUtCBXSmB2umJWSNp1vlahNxt4aHQGMQrqOkT
         PljsfMzMrqnikH6Zs43p357yxkf/mShAClpiy7Hz4qdS48b+EsGCQPajF4vspJf7vCeI
         joaiMMyrwZlVSV54k6GjeUVn98Pbp307TW3gc3qEKjhanYP9WE58OALKG0eHuqrFrUk+
         MuYmlAQCl0wM7oph+e0lkZt/NpUWOwhBEKABDNsT5eb16yQQeGVQ2aLQTHR4AtZbESsW
         B1cQ==
X-Gm-Message-State: AOAM5310UGT2IUVaeLkxfbSZE+nAYRbXH1VWK/mecaz621wrHQj2ilyF
        hFFGXx2ZjgoTA3Dr9IXRsysecg==
X-Google-Smtp-Source: ABdhPJy0os+7IoFCFKg7k+EZgJxjNXzkxcklwepEVVeiJOSzaLYyRQZOx0XwQFhan0Ma7PyXS/9uNQ==
X-Received: by 2002:a17:90a:bb81:: with SMTP id v1mr605595pjr.168.1589825088878;
        Mon, 18 May 2020 11:04:48 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c24sm172998pjs.51.2020.05.18.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:04:48 -0700 (PDT)
Date:   Mon, 18 May 2020 11:03:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 8/8] arm64: dts: ipq6018: Add a53 pll and apcs clock
Message-ID: <20200518180325.GB2165@builder.lan>
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-9-git-send-email-sivaprak@codeaurora.org>
 <20200512202439.GK2165@builder.lan>
 <80039c21-41cf-2ace-939a-ef48fd773aa4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80039c21-41cf-2ace-939a-ef48fd773aa4@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 12 May 20:55 PDT 2020, Sivaprakash Murugesan wrote:

> Hi Bjorn,
> 
> On 5/13/2020 1:54 AM, Bjorn Andersson wrote:
> > On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:
> > 
> > > add support for apps pll and apcs clock.
> > > 
> > > Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 16 +++++++++++++---
> > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > > index 1aa8d85..af2ceeb 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > > @@ -294,12 +294,22 @@
> > >   		};
> > >   		apcs_glb: mailbox@b111000 {
> > > -			compatible = "qcom,ipq8074-apcs-apps-global";
> > > -			reg = <0x0b111000 0xc>;
> > > -
> > > +			compatible = "qcom,ipq6018-apcs-apps-global";
> > > +			reg = <0x0b111000 0x1000>;
> > My documentation states that IPQ8074 indeed has this block at
> > 0x0b111000, but IPQ6018 it's at 0x6b111000. Can you confirm this is
> > correct? Same with the pll below.
> The address 0x6b111000 is how the RPM sees this block. For A53 it is still
> 0xb111000

Okay, thanks for confirming.

Regards,
Bjorn
