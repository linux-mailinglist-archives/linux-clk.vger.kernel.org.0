Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD36A532328
	for <lists+linux-clk@lfdr.de>; Tue, 24 May 2022 08:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbiEXG2Q (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 May 2022 02:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235047AbiEXG2N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 May 2022 02:28:13 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537E172209
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 23:28:09 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id j28so21684461eda.13
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 23:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N3jdbvgtlnw8zIaSv0DQqGc3caOnAXLJMAe+8f0UCS0=;
        b=O5lAcyn/cym/3OrYhOLamVEgFGcZ2RXZc2FY/HnELt4FLoY5cU6Qzd1dh/CbLJMwNP
         qKUgSM+Muoz1BLCPqw4YgLhVdAV7cvJn8lsQADC+YX0odK5WcxdVUpSqQIpNLI+vWSVR
         bGYPWSffJOcjIzQxvLSsgg4r+doFWCFL4Ke0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3jdbvgtlnw8zIaSv0DQqGc3caOnAXLJMAe+8f0UCS0=;
        b=L0lOGQLxs9Dpd2ES7pHDvDaVhG+u1OBSgSqtPkGTJTe8qwT/7ltkPCEnezj3SlKfFW
         IB/j1mbYw5ZGcz8odfOUHmRhfPSGw0KkmH/o3SosYzKcFJ55vBreUZ71QrmHCtz14OP3
         QeFnSPnq5jZoesL4t9BRgPmBqWe74IkyynQx54YJ/ibxIlkpcjFzeyNtBTXAvXJn9mP4
         qFqG6H9rNAjDfdu+IKY4rkAhMeTh7ScxhrDmei90wg9e6JFzhNrPAKqtS9ZxqV3B+qX4
         E5wiMU5Gm/CX5FT8rJOrgXK96ErQwWwyRXrzMP7GaoaY/bYl3IlXQwoDZovSID/frzir
         hmnQ==
X-Gm-Message-State: AOAM530VF5n5Uf6QDjvgsp+UzJNnKRP0VkgH8TMbBucY+Sz/M+sv1cJU
        sEbZb0shxkfRNPfR7/NHV1gF1rdT/XR3FGZvD06o/g==
X-Google-Smtp-Source: ABdhPJzBItlY43uGQ1di/pvyiuI5cG2uV8pK8/a3MYLK073piDHgVWBSg8bsrQX2VghdcQWs8SvYrgrhAjczS+pKxbA=
X-Received: by 2002:a05:6402:d51:b0:42a:b2cc:33b2 with SMTP id
 ec17-20020a0564020d5100b0042ab2cc33b2mr27392564edb.248.1653373687924; Mon, 23
 May 2022 23:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220523102339.21927-1-matthias.bgg@kernel.org>
In-Reply-To: <20220523102339.21927-1-matthias.bgg@kernel.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 24 May 2022 14:27:56 +0800
Message-ID: <CAGXv+5Gx6oGvvL1aSWfZC8cpE7mFyr5g66c=AHm3jkNCuXzakg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Delete MT8192 msdc gate (was "clk: mediatek:
 Delete MT8192 msdc gate")
To:     matthias.bgg@kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com,
        chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org,
        ikjn@chromium.org, miles.chen@mediatek.com, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        angelogioacchino.delregno@collabora.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 23, 2022 at 7:19 PM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
>
> The mt8192-msdc clock is only a single clock gate. This gate is accessed
> from the mmc driver directly. With
> 4a1d1379ebf6 ("arm64: dts: mt8192: Add mmc device nodes")
> the only consumer of this binding was deleted. Delete the binding
> decription and the clock driver bound to it.
>
> Changes in v3:
> - Update commit message to explain better why we do ABI breakage here
> - add Reviewed-by tag
>
> Changes in v2:
> - Delete compatible in binding descprition as well
> - Add RvB tags
> - add Reviewed-by tag
>
> Matthias Brugger (2):
>   dt-bindings: ARM: Mediatek: Remove msdc binding of MT8192 clock
>   clk: mediatek: Delete MT8192 msdc gate

Whole series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
