Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585172099DD
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jun 2020 08:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390089AbgFYGax (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 25 Jun 2020 02:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgFYGau (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Jun 2020 02:30:50 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB05C0613ED
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2020 23:30:48 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k6so4584339wrn.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2020 23:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=/WtZICZPQ7eo9m1fnE4Tuqm/DpL9l1L7AEtdtd4eeLo=;
        b=cy1rDnlb74CJU/MmS8SRaNduOBK/IMcdSw6QZqU53dXfuDSXBWsKhLWPBtpvSq6r7E
         RcO4czMDahxhH46p41SeRgYlbLwMnBq/09SQseikVk4HzykYYbMzM8T6kr+tjRaqkztA
         DnobMe/WEX7kQEUUSio6g4avDlXq0b+zf/HSaZV8MXJLgeUXuo1MZZq5Jc1cBJT5yQxL
         2cchTbSuzrOtQrhyZBe0q0IyZyMktMW+CNZnn+/2BLK+r15tjh3nPdg5/b2y/w0wqpap
         xYq9i4GkjndGAJ1EoiuJ+wymjQLRuIJXw4OhMi9sYHR4MJPw16wMmAc81IBnFu1RlvmK
         IRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=/WtZICZPQ7eo9m1fnE4Tuqm/DpL9l1L7AEtdtd4eeLo=;
        b=Wel4V1Em0kg4ZhrYxDgXoRKUJZ+zwUp9DsxQDWxV1jdFew03ti+03wGaJCJjX/CSWO
         fJtZ94sZBifl2xXoTV6g+pXvIb1SR9x3P5j4QyY03Ec+OrthEnZoRAzgLLZRwRPnNStV
         dg4W+IJIDU90/lzbOXBF/8ixZNlb040gOdDM0y3hpuANMzn/UyyUZzZIjRxzINiQJgaj
         ETCTzpLqOdz+lYQU+gvYNoS6UD49PrEeA+jM3wWaFsxa1ysusUVjYlQtb97TkC6afz7N
         HhR+vgy8/PPCN7IeglUARiib1463TrJ8DW5C+wUIPHaygecWl4DOMnC7QlAf8dYnyWns
         kJeQ==
X-Gm-Message-State: AOAM531PgevBdG30i5Wfy1Iir3uZPFjCxUO7DF3KUiA2tiwEne6Ynk68
        +QOvSs81fuyvud3bJaEPvnLryQ==
X-Google-Smtp-Source: ABdhPJyO0TdAwSeQKc88VNXDEhojZI+tFVF3RW4T8Yx0Xmn0VI4RIizGBQQrMbVogMt6Ij4FQCU3SA==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr13580708wru.158.1593066647171;
        Wed, 24 Jun 2020 23:30:47 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p13sm19780863wrn.0.2020.06.24.23.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:30:45 -0700 (PDT)
References: <20200620161422.24114-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     narmstrong@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: meson8b: Drop CLK_IS_CRITICAL from fclk_div2
In-reply-to: <20200620161422.24114-1-martin.blumenstingl@googlemail.com>
Date:   Thu, 25 Jun 2020 08:30:45 +0200
Message-ID: <1j366jbqsq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat 20 Jun 2020 at 18:14, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Drop CLK_IS_CRITICAL from fclk_div2. This was added because we didn't
> know the relation between this clock and RGMII Ethernet. It turns out
> that fclk_div2 is used as "timing adjustment clock" to generate the RX
> delay on the MAC side - which was enabled by u-boot on Odriod-C1. When
> using the RX delay on the PHY side or not using a RX delay at all then
> this clock can be disabled.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied. Thx
