Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED484101D6
	for <lists+linux-clk@lfdr.de>; Sat, 18 Sep 2021 01:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbhIQXnA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 17 Sep 2021 19:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhIQXnA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Sep 2021 19:43:00 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32613C061574
        for <linux-clk@vger.kernel.org>; Fri, 17 Sep 2021 16:41:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bq5so39518876lfb.9
        for <linux-clk@vger.kernel.org>; Fri, 17 Sep 2021 16:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PnbdN3UCLAUCSO4VZIIA2qQL73S6L45jVruxNydbTrE=;
        b=aWqIVvX9llY6+8fAsRoJ5vE0qofZ3Ge2tLqBWaHXKlXI++P+q9sHj+3Vs8HM+V+EeX
         7enIyaJbxFhE/wSf5//Xx2Zyhz5Y2NrVXE+ByHojfqDz9JOlmMjxBJ2oyS8xF3n22ctK
         62b9Fk8lBZG9h7xOzDtP1d9WWD1Ia0pFRuuzCtx+on5rE72/Qv1PN3QGUDb+4INDIgvK
         UP3U90hcFVxlw31d4TX3CdSKE/ZS/qdVn2VNfESCFO1b3zDd1rX4xzoMvpfxQp0uQuli
         CZCPCkMCPRvnzFoOnXYFlidK8l99mOysSDqVJNJVnPk3+erdS8Ml9wzdlIkVNIlbed4F
         6YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PnbdN3UCLAUCSO4VZIIA2qQL73S6L45jVruxNydbTrE=;
        b=jPexTs8KzX30dOwvgHFKW7HZQ+GGjYZ0ey0Yyt+JBRF68RcozxnRBYvCLMfkGlkUWl
         yo6SmYSSfSrbD38/HKk3mNWpbNeOEgG+jX+dT+iJmPRxImERMk+iWDv6JUfJZUPVC6gD
         yU8MBz86Pm5sUh6ot7YFmTsSV8u5EP3UxSkM/6u2wslUviZr4DQY0MKN6RLSqmgoQBgI
         UqWp46YzB7qi8nYhz/ygRFXNfEHgkiJWC8aetiZhJtJ3c9S8SYWpFV9Azv0HzS1dNsP9
         Z9VRD1icyCyqPrtRyNWVlDGSIrjQprgR1qNWkDYSgP6M01O/XEcG29fQ9BT/kDORQFGM
         EIvg==
X-Gm-Message-State: AOAM532SUvrVdhXWpn1YsSAEg+F1WCh/0/SNNUtPo9q7qufZAsySobh2
        m/fvSTEmX7ublI98LQ36A6KY+QWwyZTaIN5zyhrgGA==
X-Google-Smtp-Source: ABdhPJzIV512qryJ+JnO7qP7YBFgWkpHpPcXbqnJv8d2u3jbvziAQ2liUehMup4iRBRk+n/kRb/tARgPhmw9tlb6rxU=
X-Received: by 2002:a2e:5758:: with SMTP id r24mr11874618ljd.432.1631922095497;
 Fri, 17 Sep 2021 16:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210909213118.1087083-1-robh@kernel.org> <20210909213118.1087083-7-robh@kernel.org>
In-Reply-To: <20210909213118.1087083-7-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 18 Sep 2021 01:41:24 +0200
Message-ID: <CACRpkdbYGtzfc5qDGCgqFnYLi4eSB3K61DWz9ypUH9mneUrLGQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] ARM: dts: arm: Update register-bit-led nodes 'reg'
 and node names
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 9, 2021 at 11:31 PM Rob Herring <robh@kernel.org> wrote:

> Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> The 'reg' entry is the LED control register address. With this, the node
> name can be updated to use a generic node name, 'led', and a
> unit-address.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
