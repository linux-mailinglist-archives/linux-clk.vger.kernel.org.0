Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1E98CE82
	for <lists+linux-clk@lfdr.de>; Wed, 14 Aug 2019 10:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfHNIcl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 14 Aug 2019 04:32:41 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40000 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfHNIcl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Aug 2019 04:32:41 -0400
Received: by mail-lj1-f196.google.com with SMTP id e27so8875872ljb.7
        for <linux-clk@vger.kernel.org>; Wed, 14 Aug 2019 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qprk97I1dFe+WA8kDtJTqkPzn2PSILy5kREIC5Uixm4=;
        b=qMdw+xMV024LAbvccUI3jC70aaEEO5YWomLZhuABCdzO2cL+7TrxzWBaQItupTGIe5
         V5iI287R6yEzuK4400Xf11LNmZT5SP6D3BpwXIiP0REHYCp8lEccJQsiTnSQK7+qJw5c
         Adf6kT0NahAxCaB61a4PDzWh0bZsvpdye0vrJeeZ3SE9yW+n4tXTOd0BO1uq9rjGvYuB
         5Nnv5m31Aj9HkD49sGMjQwz//29/ywzsTipoA+S2vbv/e5ERHrl6TQtuGZhTkqDX2q/6
         Bt86uvuXeQ6/przYNgkxiJfzspWLBBF/cOGwWI6Nx23yadkF0Xae3G66sAVLnvA6hs3F
         KrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qprk97I1dFe+WA8kDtJTqkPzn2PSILy5kREIC5Uixm4=;
        b=SWrB1hMhvqgxIv5cEBE+JUJn2RMJu7VtpcvFtV0YkdNWQQapdSbJaemN2F7yDXylql
         6VNnXsO25OpvPtnOWjnxneGDQtMUCK/n3vUuGTnB6IhrQeCVnuzRBucaMlT1Rbe3Mhmx
         N1I+RSI266N9BpfBdNkNkxcTg0B6W+ksvMhMYQ4H53QbfhWtKDT5rQx+HCCw7e1Rc1xB
         ryYFkDAv2a3Byr/WtJX/IdJ2lVxtp8uP0COkdaoCprMp9ybrQFynF1zZIIGvH4A+eGru
         Xd4vjXBZ1NQ2oHH9Zh4gAo5rBPv30GhDN0H5hgosv8zf0FCEDp/FPFsdvfD709kbJIvx
         S6OQ==
X-Gm-Message-State: APjAAAVQC7KPGZdIUaAcjyxrE7FcYcyju6iFLa1H3yMpVimkc2K/p7fB
        AL1wtPkvfhUBnGseUqT8au6yagnpzU9RBsZeZcDaJw==
X-Google-Smtp-Source: APXvYqx+fft1SOz2IQDyCGJ15XAqb3Zjb5OEqzoV7vIlggjkoFNfsMZU8eWQaIcFkhj1gV1hUfaGOfz43NWpoIBxdXE=
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr14722764ljk.54.1565771559322;
 Wed, 14 Aug 2019 01:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com> <1565308020-31952-2-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1565308020-31952-2-git-send-email-skomatineni@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:32:28 +0200
Message-ID: <CACRpkdasx8AooB_bhUpVhU9ig_ztri3hbryiO_FEGEO+eUXwkg@mail.gmail.com>
Subject: Re: [PATCH v8 01/21] pinctrl: tegra: Fix write barrier placement in pmx_writel
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        viresh kumar <viresh.kumar@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 9, 2019 at 1:47 AM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> pmx_writel uses writel which inserts write barrier before the
> register write rather.
>
> This patch has fix to replace writel with writel_relaxed followed
> by a write barrier to ensure write operation before the barrier
> is completed for successful pinctrl change.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
