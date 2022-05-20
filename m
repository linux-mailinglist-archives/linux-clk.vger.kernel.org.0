Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1171B52E927
	for <lists+linux-clk@lfdr.de>; Fri, 20 May 2022 11:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbiETJn4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 May 2022 05:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbiETJny (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 05:43:54 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3060914AA64
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 02:43:53 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id 10so3498111plj.0
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ISg/8xMPMfr1lZg9uez8+LcDvNEZDPUAQ4cjw7mzFfk=;
        b=GwV6FZzfJb4ectmQh1Tv2YE7JL/cAmzGrnb7G6ggB2qJ06d7/Cx4fOAm6tnhSfzCc5
         fLGymIpxWMM5AWSPgfMGH3YVPyPRoJAYsFvW94d0nDzmbO/Mmdtals0dE5ABxSVAFvXP
         f8CIF/z2jE/MOX+9Wf7LLVB3ztYV56Z8aDP6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ISg/8xMPMfr1lZg9uez8+LcDvNEZDPUAQ4cjw7mzFfk=;
        b=FaOYCOeH8RUE9dgcZfOzsSbj9LeclA80RErnBKWVM7RdFli9Ev6AnnCC/24e3s5rq+
         izI1iEPMZPDovwUVphBYKCKhI5KMg5vqsV+Yiz+nUi+w+KTbTpl1cSmEfFrT/sfqqHfv
         Oe7s440btZGbfzff70edGIMdB7zCFNVH8XoFKlVcQ4rJefNnrMagOU5KCrE9pfur61zN
         yNRjNHXixzFHzPFPkRI2C6R2AmNhoI4zAZQFn3uu/RJ1yL23m/JzppNJTpB0uYkAZELv
         reWTQkk5C02p5fRW5J5svPuorYWn8jyFZmECUbE36/Xwu1eq6Lz6/QWccTAF/1EqMFFT
         u/OQ==
X-Gm-Message-State: AOAM5307yl+F9uajokfO05eh7eTck+h4PAfTzeIsivVv3tzX4OE/cpge
        ULBAYf06PtEhonaGz9qukwvQV13UQkcfaQ==
X-Google-Smtp-Source: ABdhPJy43LUtdN+xEWvgtRwLWdIsN389lpZaprg3R4KGqXqmkxm/vSRHdq0C/UG39gRhRdKmr/CD6w==
X-Received: by 2002:a17:90b:3649:b0:1db:a201:5373 with SMTP id nh9-20020a17090b364900b001dba2015373mr10116081pjb.175.1653039832597;
        Fri, 20 May 2022 02:43:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ec49:9912:894:222d])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79217000000b0050dc76281bfsm1290597pfo.153.2022.05.20.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 02:43:52 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: mediatek: mt8183: Fix GPU/MFG clock rate changing
Date:   Fri, 20 May 2022 17:43:19 +0800
Message-Id: <20220520094323.754971-1-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi everyone,

This series fixes the clock rate changing for the GPU. This work came
about as part of adding DVFS support for the Mali GPU on MT8183, to
support efforts in testing the SVS patches [1] on MT8183.

This series fixes a couple things:

1. Fix the clock reference for the GPU. The device tree incorrectly
   references the top level PLL, when in fact it is fed from the clock
   gate in the MFGCFG block. Fixed in patch 1.

2. Clock rate requests on the MFG clock gate aren't propagated up the
   tree. Fixed in patch 2 by adding CLK_SET_RATE_PARENT.

3. MFG clock needs to be temporarily muxed away from MFG PLL during PLL
   reconfiguration, to avoid glitches. This is done using a notifier.
   The framework is added in patch 3, and added to the driver in patch 4.

This is based on my "clk: mediatek: Move to struct clk_hw provider APIs"
series version 3 [2], which was just merged.

Please have a look.

The GPU DVFS stuff will be sent separately, as that part is a bit more
contentious, and the changes span more subsystems.


Regards
ChenYu

[1] https://lore.kernel.org/linux-mediatek/20220516004311.18358-1-roger.lu@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/20220519071610.423372-1-wenst@chromium.org/

Chen-Yu Tsai (4):
  arm64: dts: mt8183: Fix Mali GPU clock
  clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
  clk: mediatek: mux: add clk notifier functions
  clk: mediatek: mt8183: Add clk mux notifier for MFG mux

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  2 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c |  6 ++--
 drivers/clk/mediatek/clk-mt8183.c        | 21 ++++++++++++
 drivers/clk/mediatek/clk-mux.c           | 42 ++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h           | 15 +++++++++
 5 files changed, 82 insertions(+), 4 deletions(-)

-- 
2.36.1.124.g0e6072fb45-goog

