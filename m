Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFEFC3557
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2019 15:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388241AbfJANP6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Oct 2019 09:15:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47074 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388264AbfJANP6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 09:15:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id o18so15442029wrv.13
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 06:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=cXF4bVzNL4mZ2sHi864OWjqQClm3/0ygqJ8rSRmtP5k=;
        b=Onu3VeWm380M/EcHG3V4up0pacX5N7qyK+GcKh4RVDpsXjhG8iF1hVGSqVEDuTNHBr
         igv8Mp9D47/2O7KwJhOV05NOxTruiNNqh84p16oV0Tx3luG3ngEGsUbST7CbdzlaSvY8
         9jbAlopFmI4zkpOeVaypIcG9P3cnoQzkd1vALhD4aR6Lv+PFXfgfuPfXqNSoICsSsnee
         jDG+/79iaUkjy+lVUtSZ9UhDeF+i37n1GE1Hr3ih0F1nJtU76vwbCx/FVp+ivkyAfuHd
         uXFGB1AuXv5rMimvOiA0qlImpHbeviLnzF/aQU2N4UOkB/ABQQpWAWhtew0KVL3vygAL
         EU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=cXF4bVzNL4mZ2sHi864OWjqQClm3/0ygqJ8rSRmtP5k=;
        b=rzC/9WtR7P4FQIZ/NYtfIT+pxnM6eVwbgcIBULeiwlNN2UZ2wt3h2OZiLvPCf8n6m2
         B7SWjZvOYmwoRVQbwNX7cdwWLmculfHduMaCf1JDlbgwRnNiXwxFXvUlpU3Qmgtto1h6
         PhyobNA7x9XjtPR+BFnhKQBCN75qna9SqBaiCPcOxVxrvDCeFtlz8KFlPTcpVqoRkrlV
         gjZMOLdtbCeuSejHtCR+vv4aUFSBxcuBYvJwSKAjLoQEPTDenS0Q/dXjuokmCqKneFUi
         f0EUI5QwG/umapTFgReNPEG54GXllygALJeX41tJiskMmscSm96Do1fXPqfoeOzHT/0O
         oW6A==
X-Gm-Message-State: APjAAAU6Bqdkts404VhKX1hLyRrreXHTgyPOUlwwk2Y0Bwe/bOV0ZYJo
        4Sc+z5ElacLLTcgnGxnNdjzwoOox+aY=
X-Google-Smtp-Source: APXvYqw3udqS1Bk2K1srDEo4MExMVnaFf4vYT26GxKPArptG/M5yBwGjHsl5CLADaxkzRiOToYR2dA==
X-Received: by 2002:adf:f708:: with SMTP id r8mr17219949wrp.187.1569935756509;
        Tue, 01 Oct 2019 06:15:56 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y14sm31335535wrd.84.2019.10.01.06.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:15:55 -0700 (PDT)
References: <20190919093627.21245-1-narmstrong@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: meson: g12a: fixes for DVFS
In-reply-to: <20190919093627.21245-1-narmstrong@baylibre.com>
Date:   Tue, 01 Oct 2019 15:15:54 +0200
Message-ID: <1jh84sr4hh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 19 Sep 2019 at 11:36, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This is the first serie of fixes for DVFS support on G12a:
> - Patch 1 fixes a rebase issue where a CLK_SET_RATE_NO_REPARENT
>   appeared on the wrong clock and a SET_RATE_PARENT went missing
> - Patch 2 helps CCF use the right clock tree for the sub 1GHz clock range
> - Patch 3 fixes an issue when we enter suspend with a non-SYS_PLL CPU clock,
>   leading to a SYS_PLL never enabled again
>
> Neil Armstrong (3):
>   clk: meson: g12a: fix cpu clock rate setting
>   clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes
>   clk: meson: clk-pll: always enable a critical PLL when setting the
>     rate
>
>  drivers/clk/meson/clk-pll.c |  2 +-
>  drivers/clk/meson/g12a.c    | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)

Applied the 2 first fixes. Thx
