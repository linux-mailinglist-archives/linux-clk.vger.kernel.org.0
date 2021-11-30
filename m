Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEB2463A66
	for <lists+linux-clk@lfdr.de>; Tue, 30 Nov 2021 16:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242545AbhK3PqB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 Nov 2021 10:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242496AbhK3Pps (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 10:45:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF87BC061756
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 07:42:27 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu18so54964870lfb.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbWKM9Xn2xFZwaHfEK9OEQJFZXBlU8alMZMLf++BEkY=;
        b=hNo72FJguIUw3J4//SCG1WE05GM6kn91yQQeLaGkFBRyHnRInP5JIaBXX7Jg7auqq0
         E0Fp4993Kl+eV8htXH+Vn830560XGTxmPMdXeWicmRSImFt7QHIhplsO4zdKCN4b8106
         gIAMgoE5S3IeJrlX1rqiJD4NZDbDtX6CWj7OzJHIIHtoed75dOjR5AS42OjJI1c1cGA5
         GdFIp6gVb8+ErETwzVIx67blxGjJEIcqgag+8aYwmxPIa6xs3tOHM/0CMOwvrXTpHiaO
         gSJRCsR6eaXF52pWr4AgfTVpzASpuYt890glq2JEYebV96xb+F7mJGhBEzw+Nm+jMFvg
         0vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbWKM9Xn2xFZwaHfEK9OEQJFZXBlU8alMZMLf++BEkY=;
        b=Pih/cZCn8h+9Ev/u5lHPSaYUb3LNNtXTvDudGDhTTQFn9RrzR3WPah0zbjMhv3v7U8
         P/EYlo5UH9/52bkprhjQIHfpE+IAC0moNzfqibvjjvv742iZT9YaO+k5BkmhxluqG66p
         +ZFnSYWL1Je4NCemMpzeOgdIMAVEsW4LfaE10iXeXmWjv5zGS5rbe0OLSwcqMC1gq/w/
         0wpaqp/ohXxnMEQnpyBSNw0JcCLTD1mMD5IpDDCmK6PJJvrfEUl/8ycMKNIjfO5vl+N7
         DkWCFultXN8pDBgrnuC1l8v4kc0VzJQ/I4nOv3yEnpPJqAZU8n7H+bbMM7PKZ7PrDL63
         Tpng==
X-Gm-Message-State: AOAM533g8x9jo+XHE93nyouJ6QpqHtGkMDFKX5KIjh0TNZ5rNfzVsMHL
        p1OswaYeGFLM2cXAi+/ls6+abgcl6tU2nF7SPeCVzA==
X-Google-Smtp-Source: ABdhPJxkVm8zHo+0JrioJtZwtgAfyQdYXd1nGp/UrLj5Wi3K+MS7vNAPj00qeL3DDQrtGJ7m/zhMDNmerhnM7oZ2vtg=
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr4420lfn.358.1638286946279;
 Tue, 30 Nov 2021 07:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 30 Nov 2021 16:41:49 +0100
Message-ID: <CAPDyKFqxso-_ed4KsFO9c1M_ss65KKAPf9wYiKKOU_oLCUvzcQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT
 compatible string
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        Kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 25 Nov 2021 at 22:15, Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add i.MXRT documentation for compatible string.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index d5be9863009c..3fd6deff07f2 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -34,6 +34,7 @@ properties:
>            - fsl,imx6ull-usdhc
>            - fsl,imx7d-usdhc
>            - fsl,imx7ulp-usdhc
> +          - fsl,imxrt1050-usdhc
>            - nxp,s32g2-usdhc
>        - items:
>            - enum:
> --
> 2.34.0
>
