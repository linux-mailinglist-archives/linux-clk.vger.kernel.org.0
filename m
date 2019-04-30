Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB71F029
	for <lists+linux-clk@lfdr.de>; Tue, 30 Apr 2019 07:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfD3F5R (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 Apr 2019 01:57:17 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33367 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfD3F5R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Apr 2019 01:57:17 -0400
Received: by mail-io1-f66.google.com with SMTP id u12so11189302iop.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2019 22:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=hWKX2lq33x/bqH4d/le0jFr8W3N+Bkvqbw8w1QPkiFM=;
        b=Ov+Pp32oKqWJj+v2leV694xGyb6S9up7lYYPQ7oPHjhx3oukgMTTT/m041MXK0SWuF
         8jCINE18h1zeq+ydDj0F62gr20ryYRJ85Dm5sTjO6KyiirqCrKrdtYGIjQhM59z6EAhL
         Wr1VtvCw1+jJAlFWtUgxPPCN51CN8gFH4tVTW/7mLD+fI1slgsPknuRb+Wb1gri/ycRv
         cnrc/bLP3jqEHaGqNnt3532193nrUmQbCJHp2CDs8DGxqFZBZpzu8r6BBCIyizEuq2sG
         B7P8TtttCHzh03mza9oh3/iZgqbqAEOa3zMUkHLnGB1p7+BxfihpKzCW4KeiWYkWqwO4
         HT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=hWKX2lq33x/bqH4d/le0jFr8W3N+Bkvqbw8w1QPkiFM=;
        b=o/KQW4TqGvNCrq0un8mt5K2uU82te5RW26b/5noHRrbGEJ2AGowSTYbJ0MAsluu/az
         xWJx1ghiRhNgtOwXQGk1FCUC4E/scEYtsp7Y8Nw4qqXW/gqbQ4YbDEl5KCdlicvD0SiG
         uq4D/yGysdeOAt1HIXdk+0+LihdNv/e9R3axB0COahjsIogsdhKYwZhv18VdM4jxxS6E
         ob/t1z5+Fd0XMuVwZEPNiE+Lw3NI4DXfDER4N7rPZqrHbCxpJQGiAXqjlndpNL6EQlCP
         UuVv8xrOQbq0K6P69jZvBP0Mar/Zsh4NYghFjFNk5c4PpS7wbkInp4aq+kfS1FqyfT7d
         NZzw==
X-Gm-Message-State: APjAAAWk8wIZ5bXJVVivJP3RRfbUZX+gQqDzx5O1MBDqaouRAoSSdCn5
        rB6RmYCmiLZ8wStckvDyyUihfA==
X-Google-Smtp-Source: APXvYqzAC8eAlzqjeLLMoD/UHDZ5ijbGvpg1RDOoBrDKbcOzIOLLnUjbc9ho0YTyKwMXMw2TI+tDcg==
X-Received: by 2002:a5e:d702:: with SMTP id v2mr3816669iom.236.1556603836719;
        Mon, 29 Apr 2019 22:57:16 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id a124sm926073itc.18.2019.04.29.22.57.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 22:57:16 -0700 (PDT)
Date:   Mon, 29 Apr 2019 22:57:15 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Stephen Boyd <sboyd@kernel.org>
cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Paul Walmsley <paul@pwsan.com>,
        Wesley Terpstra <wesley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Megan Wachs <megan@sifive.com>
Subject: Re: [PATCH v3 1/3] clk: analogbits: add Wide-Range PLL library
In-Reply-To: <155657878993.168659.6676692672888882237@swboyd.mtv.corp.google.com>
Message-ID: <alpine.DEB.2.21.9999.1904292252120.7063@viisi.sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com> <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com> <alpine.DEB.2.21.9999.1904262031510.10713@viisi.sifive.com> <alpine.DEB.2.21.9999.1904291141340.7063@viisi.sifive.com>
 <155657878993.168659.6676692672888882237@swboyd.mtv.corp.google.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 29 Apr 2019, Stephen Boyd wrote:

> Quoting Paul Walmsley (2019-04-29 12:42:07)
> > On Fri, 26 Apr 2019, Paul Walmsley wrote:
> > > On Fri, 26 Apr 2019, Stephen Boyd wrote:
> > > 
> > > > Quoting Paul Walmsley (2019-04-11 01:27:32)
> > > > > Add common library code for the Analog Bits Wide-Range PLL (WRPLL) IP
> > > > > block, as implemented in TSMC CLN28HPC.
> > > > 
> > > > I haven't deeply reviewed at all, but I already get two problems when
> > > > compile testing these patches. I can fix them up if nothing else needs
> > > > fixing.
> > > > 
> > > > drivers/clk/analogbits/wrpll-cln28hpc.c:165 __wrpll_calc_divq() warn: should 'target_rate << divq' be a 64 bit type?
> > > > drivers/clk/sifive/fu540-prci.c:214:16: error: return expression in void function
> > > 
> > > Hmm, that's odd.  I will definitely take a look and repost.
> > 
> > I'm not able to reproduce these problems.  The configs tried here were:
> > 
> > - 64-bit RISC-V defconfig w/ PRCI driver enabled (gcc 8.2.0 built with 
> >   crosstool-NG 1.24.0)
> > 
> > - 32-bit ARM defconfig w/ PRCI driver enabled (gcc 8.3.0 built with 
> >   crosstool-NG 1.24.0)
> > 
> > - 32-bit i386 defconfig w/ PRCI driver enabled (gcc 
> >   5.4.0-6ubuntu1~16.04.11)
> > 
> > Could you post the toolchain and kernel config you're using?
> > 
> 
> I'm running sparse and smatch too.

OK.  I was able to reproduce the __wrpll_calc_divq() warning.  It's been 
resolved in the upcoming revision.  

But I don't see the second error with either sparse or smatch.  (This is 
with sparse at commit 2b96cd804dc7 and smatch at commit f0092daff69d.)


- Paul
