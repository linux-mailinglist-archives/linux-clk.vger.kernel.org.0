Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90FF42E23A
	for <lists+linux-clk@lfdr.de>; Thu, 14 Oct 2021 21:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbhJNTz6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Oct 2021 15:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233601AbhJNTz5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Oct 2021 15:55:57 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD954C061755
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 12:53:52 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id j3-20020a056a00234300b0044d605e3e0fso3872304pfj.21
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 12:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=R/A1A0PEacctbWxfoyinE4EXZjh0hs5rayBemyeKvhs=;
        b=Ccj60KB5+clN/g8yw8V0AvFPqpYtRevRPNAl88ECaouDXwhePm0EVHn3TvUZXBuikb
         NAKgCmTzauq5p0dQbKjSIBENAVJbSfMBQSV+lMb5tUj2fFi3+Aq2GeRXo9by7rMu/6f5
         D7PpHFhD7x1sF4gdy/3JxjrmCmAM4yTrv29zz80JGrCedp6YfuqRmzzfqaSv/esEj9sr
         SLCJqftzhLudSp/QUTsOVfNuQ2FNHexSrmZ0TCNe8tG8xU7TaoiEKHZm0Jtr8DkueIT6
         5shOlqnZ4vWy2erzNJHml8C/2dGDK29j9cxITM0usC7jpgFRtQGx0tChJVwri9MFfOxd
         /Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=R/A1A0PEacctbWxfoyinE4EXZjh0hs5rayBemyeKvhs=;
        b=xaUndQMZhwp4RNK5pVhPknTrudXlYbnJMeFKsCpwf7U7LdzAwiStUvf4qXfHEODwe8
         C+Vx16uc6/TQYi1KgUJCGo/3hO6Ap4gbcaaBrqalNdzWDIEL/SjpOddm+9V44zOSVsaz
         hrIVWjZ2XYvgoIPmxzAS4Y4mqj2FEDQfw+Hf+XwKh6bPHw/1Iz6OZ4a0EeweD3r0IQt0
         kbb9CGA6i97jzuPN4plVO45u7+AjR1c08jc72b/28hfRsikSyiAqrxhw/CxxA3EIFzua
         0NnOzdDX3maeRu04VaBYh+MJw1ltGZ2yLF16Chunu2X3YiSMBOPh9rVRwI+yOofZpyex
         qTMA==
X-Gm-Message-State: AOAM532qF7OIfnQ8mUFPkfciv5sBREYjAA2F2Q/rAtNRgwPFQsKoF/9r
        POKD0KLgUdcpKvPYD03/vBdIOobpO42lcTixNSQ=
X-Google-Smtp-Source: ABdhPJzJB0746aYvHaw0UyQpC8oiqKxrUMbT0zTR2WHYcybIVao09r4yq54iQiEOGomsy45bhkxA4UHH5Xjs/8E1XLU=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:b70d:b0:13d:f6c9:2066 with
 SMTP id d13-20020a170902b70d00b0013df6c92066mr6942092pls.2.1634241232300;
 Thu, 14 Oct 2021 12:53:52 -0700 (PDT)
Date:   Thu, 14 Oct 2021 19:53:44 +0000
Message-Id: <20211014195347.3635601-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [RFT PATCH v4 0/2] clk: samsung: add common support for CPU clocks
From:   Will McVicker <willmcvicker@google.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Will McVicker <willmcvicker@google.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These two patches were originally a part of the series [1]. They add
support to the common samsung clock driver to parse and register the
CPU clocks when provided. This allows for the samsung clock drivers to
simply provide a `struct samsung_cpu_clock` to `struct samsung_cmu_info`
and then call samsung_cmu_register_one(). With this new support, we can
now get rid of the custom apollo and atlas CLK_OF_DECLARE init functions.

Since I don't have the hardware to test these, I'm including the RFT tag
to try and get help testing and verifying these.

[1] https://lore.kernel.org/all/20210928235635.1348330-4-willmcvicker@google.com/

Will McVicker (2):
  [RFT] clk: samsung: add support for CPU clocks
  [RFT] clk: samsung: exynos5433: update apollo and atlas clock probing
--
Changes in v4:
 - Updated 'struct samsung_cpu_clock' to reference the parent and alt_parent
   hw clocks via ID instead of name
 - Dropped __clk_lookup() in favor of ctx->clk_data.hw instead

Changes in v3:
 - Same as v1-v2
 - Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

 drivers/clk/samsung/clk-cpu.c        |  18 ++++
 drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
 drivers/clk/samsung/clk.c            |   2 +
 drivers/clk/samsung/clk.h            |  26 ++++++
 4 files changed, 94 insertions(+), 72 deletions(-)

-- 
2.33.0.1079.g6e70778dc9-goog

