Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7376E3BC835
	for <lists+linux-clk@lfdr.de>; Tue,  6 Jul 2021 11:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhGFJD2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 6 Jul 2021 05:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbhGFJD2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jul 2021 05:03:28 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C235C061760
        for <linux-clk@vger.kernel.org>; Tue,  6 Jul 2021 02:00:49 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id w11so28247754ljh.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jul 2021 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V+h3JtgA85w3ih3Ol+1pWqD1Au/+HrPPpAy2ittwSGA=;
        b=K4USMV+7sbHwthRH15FlFzIc1yBbaeh0JttDHJ8wMAa2l2CP2YbGZUSGJTqmfVwqVi
         Af53x9OQRuaF5L3jr+a+iScjWpHOaz8bqVpmJOf+NVTy83ktMCPtFN4cMZbYJsI2gIOH
         NstOKL0ncWZp4rDgEXVlamWHnR3ZuckRgvbEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+h3JtgA85w3ih3Ol+1pWqD1Au/+HrPPpAy2ittwSGA=;
        b=bvoI38KrxBJaYL+SLIdKaI/TpJgkUCcXbXtnLUQOQX0gG9d6hXldcaTIgVyZpNcIlc
         /vilmLye7WLH/E1dK/nAt0gso7NLBtBsuXiU61xFdb67m/cd9zXxeoZEsUryGhJTBPdJ
         jX9RmPJ7oijeCqmSxrqz8WIcsE1HqseYMRtj6P4a2hJHcGB1uG4p/mnSEW044UaZ+H5c
         aEDA0u8ye5Qcsg6PQ798SaiDq35t8QkY7AEzp3dvdRjTn9TQiF8Qn/rus9pvgDVQxR+9
         n/VRhVzr2CD+SWEcBx6G57C0xhiW3U2mb3smbUFebG2mzZoXUdr41ssSx/Jb/PpKECeF
         Ulsg==
X-Gm-Message-State: AOAM531frwfBrBka7WATWLW0i+RDE4EJPDAnjja+y4rbL781MyNl+xYX
        hl9wRI/uQe1/qSMdCd0H+4Ht9+CLJQdXt9xUNWDGsA==
X-Google-Smtp-Source: ABdhPJysf+qvbozSY/BYEowLfeIAMZMyQE3d9EPm2uqEBDA6bWwtUjwO9iQrFfp7Cai6FwC0Uf4CrqOkCjtEcpE9hgo=
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr10379699lji.437.1625562047660;
 Tue, 06 Jul 2021 02:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com> <20210616224743.5109-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-9-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 6 Jul 2021 17:00:36 +0800
Message-ID: <CAGXv+5ETXT-pxuP1NFEUrV+m3RR25zD9RZmDjHxVOLOy7gGj8w@mail.gmail.com>
Subject: Re: [PATCH 08/22] clk: mediatek: Add MT8195 ccusys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 17, 2021 at 6:59 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ccusys clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Also, I noticed that Mediatek drivers don't support the reset controls found
in these clock controllers. Are there plans to add support for them?
