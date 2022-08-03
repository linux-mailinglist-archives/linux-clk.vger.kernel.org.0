Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18125894EE
	for <lists+linux-clk@lfdr.de>; Thu,  4 Aug 2022 01:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236892AbiHCXlt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 3 Aug 2022 19:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbiHCXlr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 19:41:47 -0400
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81EE82B192;
        Wed,  3 Aug 2022 16:41:21 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id h16so9228874ilc.10;
        Wed, 03 Aug 2022 16:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=kgQV8evlK8DU9bGOyRx51eG2cHMOKapUxufVek7gXiE=;
        b=1gnXvmmFdlnqyws9BN2JZ7yPRXqlyrLV3LL4HcOBxnTwHT/Qqbk6F6EvpwsItn8tAK
         ulr7iMyzJKxfNBwnHOHS6OvewOiNyYHtw8DmoiCIDVL1u/Y1qHLWyIy4A0etPrv0NOT4
         QJzHM9Kd9ogHJNZF2rCYuWrbouddYPT3tCpkrs4gaaE5zccPUFbbz43KcR1ZG2ri+y1D
         1PFoV3mo96ugF1UqmrJCpEfbPlfLEF+eOpDDnG/ysNbZkHDoF1nADXrViu2TsXtP3nTA
         MXIpt7Wn4TxTbXSx34KkAeLeJRXjXn71Lbc/f/JIzvOOpWXDeOfgA1uoVZ4ouXDDGKFH
         zV/Q==
X-Gm-Message-State: AJIora/cYavbXSdmRUSGhaExSmAeMvz1R3BlbAhx675h+xAIx6ho4QJs
        t1haUXEI2vpiykV3MhiPZQ==
X-Google-Smtp-Source: AGRyM1vQk8aCyO0qOQaScZFvrl3vaMY2zJmQHoi2y8h8dbIPWsXMC60nfjqSQ+P+Dzji5a/z9aUnaQ==
X-Received: by 2002:a05:6e02:1445:b0:2dd:470a:13aa with SMTP id p5-20020a056e02144500b002dd470a13aamr10821078ilo.211.1659570080796;
        Wed, 03 Aug 2022 16:41:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m15-20020a056e020def00b002dd16300beasm7513427ilj.51.2022.08.03.16.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 16:41:20 -0700 (PDT)
Received: (nullmailer pid 2828251 invoked by uid 1000);
        Wed, 03 Aug 2022 23:41:18 -0000
Date:   Wed, 3 Aug 2022 17:41:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org, robh+dt@kernel.org,
        abel.vesa@nxp.com, kernel@pengutronix.de, sboyd@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: imx93-clock: add more MU/SAI
 clocks
Message-ID: <20220803234118.GA2828200-robh@kernel.org>
References: <20220803081713.3504699-1-peng.fan@oss.nxp.com>
 <20220803081713.3504699-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803081713.3504699-2-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 03 Aug 2022 16:17:07 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add MU[1,2]_[A,B] clock entries.
> Add SAI IPG clock entries.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/dt-bindings/clock/imx93-clock.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
