Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7365346AC34
	for <lists+linux-clk@lfdr.de>; Mon,  6 Dec 2021 23:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357173AbhLFWix (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Dec 2021 17:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353473AbhLFWiw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 17:38:52 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F584C061746
        for <linux-clk@vger.kernel.org>; Mon,  6 Dec 2021 14:35:23 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id n66so24122590oia.9
        for <linux-clk@vger.kernel.org>; Mon, 06 Dec 2021 14:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DhvZFUwOkAZXZQA7FoVZeemrVsEW2J8hg8Pj7XliR4A=;
        b=g1h484dFlNyF9Wsj3xnPgWJj5hWssUxTxZ6bqQIAX4Fq+GucwzVfdyrXQ+uLcjqn+o
         2aOuW9DQN6j5vhYeXpFmEbtFkqawBz8W1fZ6CkeyaOd5PChyasyUjfEiV79T8jpCE9/o
         pN9xzhyRq6XuM9zkSkSgVxDyds5k/xKOIcpKiThHbCusbXJes6OFpdTCtoa0DmndnfWi
         sKk5ggrDu3OD2qlUZdFy+GiQ4S3wBLz8bTbldV4ExzPlynlwVA7sFwCtoNNy+h0SCVSs
         gArItCT9y3lEYGu/tAyNuKuc9JdeGfC/OATYXJPGKP12iZAWJwOKH8mS/69pvtMwosnB
         5XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DhvZFUwOkAZXZQA7FoVZeemrVsEW2J8hg8Pj7XliR4A=;
        b=uSBqTwnEF4xVZSI/CqkM7VB2C/MOqQMM5W0lGDE7CVR3RJgGk9OBsqOp8wGAVwEfrB
         0OAICMc0Dfh/jCtsSKZfrU2SRz6GngMYlS6PZQduprKV2Ht4a/PH+0MbONdEBX3pTq3v
         AqW4X8ZHdIuhFzrnphKEP+UiCU707g8VfFVGd1Wn9Mbmm09r3929uuRrd5ojg5Fb9QSZ
         BSUgo7dhhgYS4aj8q99boR9Szp0os6n8fCCm9zNsqgy53FJQnyyBH1/CNvUz/26ceorT
         1SEvaUZKggXn2SO8eFTaWX0SUofytkiA4Z4K3zvkCd8iYNT1r6GJO0cSKvkmAg+CBWfQ
         peJQ==
X-Gm-Message-State: AOAM532Kk3r/Vc6XuoboG+dDsRNxjBY1xNuL+Hvl6Bgml3K5iAU/r4Jb
        z2NrDrgPAHsRXZmJAbW3lb/ObQ==
X-Google-Smtp-Source: ABdhPJz7imL1gvY5N57CQ/NMfhAb7IBExNF/uGbiDOiTAR6vNRkHVBKLWylvZ26zru3OuezwG7i+EA==
X-Received: by 2002:aca:b407:: with SMTP id d7mr1612001oif.116.1638830122827;
        Mon, 06 Dec 2021 14:35:22 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm2586360oth.81.2021.12.06.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:35:22 -0800 (PST)
Date:   Mon, 6 Dec 2021 14:36:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: smd-rpm: Drop binary value handling for
 buffered clock
Message-ID: <Ya6QgJ9kDuSReZGC@ripper>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
 <20211031020715.21636-4-shawn.guo@linaro.org>
 <Ya4rtHSS1tLm7Gbi@builder.lan>
 <20211206222114.B47C5C341C6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206222114.B47C5C341C6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 06 Dec 14:21 PST 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-12-06 07:26:44)
> > On Sat 30 Oct 21:07 CDT 2021, Shawn Guo wrote:
> > 
> > > The buffered clock binary value handling added by commit 36354c32bd76
> > > ("clk: qcom: smd-rpm: Add .recalc_rate hook for clk_smd_rpm_branch_ops")
> > > is redundant, because buffered clock is branch type, and the binary
> > > value handling for branch clock has been handled by
> > > clk_smd_rpm_prepare/unprepare functions.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Does that mean you picked it up? Or you want me to pick it up?

It meant that I reviewed the patch, but as it's not a regression I then
went on to pick it up for clk-next - there should be a "thank you" from
a few minutes ago.

I'll ensure to include a note for you in the future when it could go in
either branch.

Regards,
Bjorn
