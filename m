Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0720344A3D0
	for <lists+linux-clk@lfdr.de>; Tue,  9 Nov 2021 02:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239982AbhKIBa6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 Nov 2021 20:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244243AbhKIB25 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Nov 2021 20:28:57 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F25C0797BA
        for <linux-clk@vger.kernel.org>; Mon,  8 Nov 2021 17:07:26 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id o26-20020a4abe9a000000b002b74bffdef0so6441882oop.12
        for <linux-clk@vger.kernel.org>; Mon, 08 Nov 2021 17:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ednwC4rk+fMRoZ56y8enAsmD1OcJ155WuvM3vrzbF0g=;
        b=kW2VZKXq10e3+j2pN2rREnvfGn/ed2pBKv/FDDZGYkiJ1B/Tm+e592rBZOssvxp1nL
         lJ8uNMknOuWUpEbsMD9f5YGmpAyp6iPS1isss6b24feSEfiOdZDz5BB1kClvWeRx3m+k
         nSKJo7mf0P6cENwhEMcYQl79zQf2G4kpxcTjF8qti3XLvenzR4E8B9owfJGlT5swp/tO
         0E211Heecg5kaSUuT4hqK7LMmN/Dv9ANQuL2x50Vl2dhZTV7X4DyPTdhV7FFap/gkuZA
         a7curh+yVVMTtyUoMlA9s4fMN4nseVOWXU0tC4BMuT7AR0lvBWHgKVcMoJw8R1BKkXeI
         mtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ednwC4rk+fMRoZ56y8enAsmD1OcJ155WuvM3vrzbF0g=;
        b=XFmeAmfPoZHyUATL6Uku/zp/bURTo+epewXSGMI+7a/n/0NnqSsGZltdTyy+fMjMo7
         kJEw00CEsiC0PoCH72ugleSPL2xdW8w3HmPS3VMkkiKqOALAubnUE5YudGuauiEFtTv3
         OJ3N3MFkfiwoTDft8SIMzxxj7S8LUOFnfe9lCSLGVcyu0iLvumRjDD7P+jbQBr5kRM1y
         MPkn+e8mwukGw81pZ2aKumKmtH4jo/zEnA9l1EJQTIKXLJuEcy04pEt+cfGRroVoH1Xv
         8Nv0C3DvaUnl5h5bHi3ucgtSybZRRPVnzBDzcxlecj5CejC1bYx7cljKQhJjj4Ty1Hfd
         o7Zg==
X-Gm-Message-State: AOAM533BTuFmKPAZ2NvXedFPTTgkaY6cnHZCa+kcp1DDC/cjPxEnFaqB
        qPgmP1Dg90YQGShRUPAGg2uVheM9aQ4eEyyLtP4L+Q==
X-Google-Smtp-Source: ABdhPJxZSqASgOxakIs7bpwXgWYlDpKIrlNu94fm32sHo3EvuzrjMEZORAzZOMFOE3CUot1IZlKvoozayP2kRdmgAXQ=
X-Received: by 2002:a4a:e5cd:: with SMTP id r13mr1831608oov.84.1636420045513;
 Mon, 08 Nov 2021 17:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com> <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
 <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
In-Reply-To: <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 02:07:14 +0100
Message-ID: <CACRpkda9e8FtjR3XB97Lu8X5=yeApk==4+zSqo3Qp6bWxgJAcw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, mturquette@baylibre.com,
        aisheng.dong@nxp.com, linux@armlinux.org.uk,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, adrian.hunter@intel.com,
        linux-mmc@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        festevam@gmail.com, ulf.hansson@linaro.org,
        linux-kernel@vger.kernel.org, stefan@agner.ch, olof@lixom.net,
        sboyd@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp,
        linux-clk@vger.kernel.org, arnd@arndb.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org,
        gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 3, 2021 at 2:38 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Ah I thought it would stop make at error i see it now, is there a way to
> do one file.

Yes:

make dt_binding_check DT_SCHEMA_FILES=Documentation/...

Yours,
Linus Walleij
