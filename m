Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDBF51C2E6
	for <lists+linux-clk@lfdr.de>; Thu,  5 May 2022 16:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380778AbiEEOv5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 5 May 2022 10:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379950AbiEEOv4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2022 10:51:56 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780575AEC4
        for <linux-clk@vger.kernel.org>; Thu,  5 May 2022 07:48:16 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f16645872fso51019287b3.4
        for <linux-clk@vger.kernel.org>; Thu, 05 May 2022 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4fRFYc30vVTKimcmiwmc/0s2zAjApXTdSQH+fCjeZc=;
        b=RJ2dL8Z98GnnChZ/wAx/Tr3GNrlubI/Ewxr7kL1jUgW10fqmD8QWLcd4v0P0B7c2oF
         UOuPty7DvnIP1hXx+4fNrmF4PP3yczk9Hst/YhDTg+Zb9zDBVJS5bJvPDOlNBe26/Ym7
         5dhH9mU7w2xc3ncmzXxeiuBl/mKCd+TS6gP0El08mxQGz5pARUKOW7V4nrtGqq3CkMG+
         OA+QOwpugB3TZYh8/6FWTlx3/SgtKPqKpklqLYymNJo3BJ2iiUJ+nMr83YInf2rO1oGz
         uRPKDuwtDKnzLTbt4wK0x6Pjs4WAWVLTMlGV2DE7HYEVcryX9h6eT4VdvTPMfY1xLFTW
         +nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4fRFYc30vVTKimcmiwmc/0s2zAjApXTdSQH+fCjeZc=;
        b=5jGc85pfmc5+PcOM4O7PsmQoJIYqStD76ukthkYMdzSJVUnEsqDPGUuVkIAWqTar1E
         7w2wbv9K6AeljNLxdbr7dH4gen0kteg3PSYRU3uqmQCkQWpAtCwiBunC6DNm/+FcbISN
         e7KeWDelEZl3I+beWJLrpCjxp4WquwDlWuHVDYZuG6lLhcvsrSpaBtUcj954rcprmKtf
         jWSnvG7lBp6tiwSsRYUtGhVb/AjEk/dZ3Oj543xh9LhcaKveFDRhXp6DZIsFa8EQlWuu
         VAyqrzIUVuDpN3uYkmvSTDAc6Nh5SRd9sCuzgGd8Dra3hdXnkjVsMRJg+yYXOUaJt+99
         ChAw==
X-Gm-Message-State: AOAM531a8rv8u63RHdN9qNF52N7K/9/dAbM5gaZ+pSAtzzVaDa9q7pDG
        a1I6Z0sRDm7qRv+wu9/EklkHsnpBrFtzfGl7KJzLOg==
X-Google-Smtp-Source: ABdhPJwXNLddrQVGyZC3ybRhuNgnpP+SATbyxZTf2xneFJRsYXVCHMlzU26U6NzDh94jiPLqra4RbLz9ctv575Xjku0=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr23701819ywd.118.1651762095701; Thu, 05
 May 2022 07:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-13-Mr.Bossman075@gmail.com> <CACRpkdY2MNkAKhVOQ_Eyq0AwOtEW-seSrxgsJ2D8E78u636A8A@mail.gmail.com>
 <5b8a7e58-1b84-6a6b-cc9e-b4224392b5ef@gmail.com>
In-Reply-To: <5b8a7e58-1b84-6a6b-cc9e-b4224392b5ef@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 16:48:04 +0200
Message-ID: <CACRpkdaK6q6mBTwdxq4sJGUwuzmz+xqCc+G0L9O+=Si_QAkMZQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 5, 2022 at 1:23 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> > If I get a review from a Freescale maintainer on this driver and the bindings
> > I can merge it separately, correct?

> That's fine with me.
> I cant speak for Abel or Freescale/NXP maintainers though.

I give them some time to review and if I lose my patience I
usually just merge the patches.

Yours,
Linus Walleij
