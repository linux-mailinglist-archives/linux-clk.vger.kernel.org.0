Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16899F11A
	for <lists+linux-clk@lfdr.de>; Tue, 27 Aug 2019 19:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbfH0RFJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 27 Aug 2019 13:05:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37735 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0RFJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 13:05:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id f17so19403631otq.4;
        Tue, 27 Aug 2019 10:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+gB1Kla9RO8vfObOwL3Zz+I0DqxA21AD90CmgmUfSMU=;
        b=jgUO75GUOvPyF5eNnpoE60+/wIHxgaAcPjokMHJmrzssBsa78Glh/6PkGCYPuSUcYE
         dclxwF4QKeq8jtN9qTCLB4oIKIb8Gc1jwBw15GRgXwrnZS8nBp+c/U/L9JW3noA7yzi7
         BON+2jyGx7eNAmMXHWlSTwrr+aZ4X5ZYRKHIzxMKngYm534gndaMDEAy402AG76yN2Vd
         K1UuXsZ7JG3BY+Ws4rtaU3Kc0PmPexyXopBRmIaSNbzgaP1WnhgEfKkWhmtxy7K9MEEi
         ZvntwUdn7cc8MAK41Zj0PL2md7vGWdrJQxJ1D1IEQiou9YbhZutchK3V+IhmqRT6AOJX
         3C0w==
X-Gm-Message-State: APjAAAWlNDkaQsKTGvwUb+klolR+N2K8YJT9WAdBKzPaME8ONnLZQV8d
        aVG3AoVYQypPd14pbbDS6g==
X-Google-Smtp-Source: APXvYqzHBNcmJDDpan/WxDf0ZvA9bvKRVFpjTGeXe4nK7SEkveYLa6EsV/XHxkTBjZz4pnXQa5wvNQ==
X-Received: by 2002:a9d:7d12:: with SMTP id v18mr13007924otn.342.1566925508616;
        Tue, 27 Aug 2019 10:05:08 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 20sm5617048oth.43.2019.08.27.10.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 10:05:08 -0700 (PDT)
Date:   Tue, 27 Aug 2019 12:05:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Message-ID: <20190827170507.GA16423@bogus>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Aug 2019 07:13:16 -0400, Dong Aisheng wrote:
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availability.
> 
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree and make us be able to write a fully generic lpcg clock driver.
> 
> And we can also use the existence of clock nodes in device tree to address
> the device and clock availability differences across different SoCs.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v3->v4:
>  * change bit-offset property to clock-indices
>  * use constant macro to define clock indinces
>  * drop hw-autogate property which is still not used by drivers
> v2->v3:
>  * no changes
> v1->v2:
>  * Update example
>  * Add power domain property
> ---
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     | 36 ++++++++++++++++++----
>  include/dt-bindings/clock/imx8-lpcg.h              | 14 +++++++++
>  2 files changed, 44 insertions(+), 6 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
