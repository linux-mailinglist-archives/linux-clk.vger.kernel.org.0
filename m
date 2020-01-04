Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C13012FFDC
	for <lists+linux-clk@lfdr.de>; Sat,  4 Jan 2020 01:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgADA7V (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 3 Jan 2020 19:59:21 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:43661 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbgADA7T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jan 2020 19:59:19 -0500
Received: by mail-io1-f65.google.com with SMTP id n21so41579997ioo.10
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2020 16:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=he5w4xe5758mzPhyknWVdWn5blsV7hMVch+zol3itAA=;
        b=JgU5AgvhrS9PrAxKSXjwiW6o7El5qXTcLpLhO7WuGVcwXTIT7GMAEOBxA4wk79crOl
         C3X21vmSjLF7LEtd8inLaM9RnWha42A25AThlknAJiS2Qz3msNapEVKpeaIpSu07cvOq
         /7dEAo9IefpjgoM67hWeiQkbbXmE9TA5/aT6hcwzdimD4xlcXd8Cf3cWTZqRRHlKyxIv
         X/qFkSGG7scoEnE3nLGQQTAy/I2tn3+ZLyQk1qAomRw9DWaino/O5TpLmRgkIaFTDF9Q
         rvZBSWEj6a3oqRNv7vuXojd1PY/o7SEZoHXYwrvdeR98QLIzLMYoTR5HWpRNOz/L92Qp
         pONA==
X-Gm-Message-State: APjAAAWiw8FBDahR2HJJRbMKvsovWoDIUgdB1+0CzymLdDhIPbnTxibd
        mSJnEuDxdSW33m5ciZPdUvL1eEY=
X-Google-Smtp-Source: APXvYqyG/c1dV0GhAKRQjRlj1gnY99CbPehnAV3PQoHSnJPEfw9CSV9Mnsn9LxtABIZyrY6VQmmwBA==
X-Received: by 2002:a5d:9d03:: with SMTP id j3mr61779476ioj.266.1578099558639;
        Fri, 03 Jan 2020 16:59:18 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n5sm21387668ili.28.2020.01.03.16.59.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:59:18 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:59:15 -0700
Date:   Fri, 3 Jan 2020 17:59:15 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V3 3/5] dt-bindings: qcom: Add ipq6018 bindings
Message-ID: <20200104005915.GA14735@bogus>
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
 <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri,  3 Jan 2020 17:19:35 +0530, Sricharan R wrote:
> Document the new ipq6018 SOC/board device tree bindings.
> 
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
