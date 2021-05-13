Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C42B37F335
	for <lists+linux-clk@lfdr.de>; Thu, 13 May 2021 08:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhEMGtd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 May 2021 02:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhEMGta (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 May 2021 02:49:30 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40382C061574;
        Wed, 12 May 2021 23:48:21 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id j75so24477474oih.10;
        Wed, 12 May 2021 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z6tZmEdAIz11OEqcWv4ru9dd59l195jpVVBqhcrPEX0=;
        b=b9QkGe4zK+dx4wsbk48L8qavI62p2qN68LG/PuMGYGlBENAP+/hsp0V8NJDLib3EM4
         dCB7euIdMSXqJJ1y1k7mdGYCGI8b+EgXkudgeRWfexCKF5KP9X2GU6M/NjjpJKE1c6/A
         NKnOSOh1glcDMttLNwRW0oFz1DxXx55mt/8NnyQL4dESVKyEryhKjrq6IiER7hmXO7aZ
         pTIc7lQ9HhlZuT+puHCy8+LJdu6YfSlLZcWOvIMgfZcsBLK02x0iCpjVLVkSlvMw906P
         fzH3q8auwUCMyvzq8brRnmmVwy8uH78TZp8NWJRSXsukgVjBIHWFL+C3iQCAcXWkSb9Y
         ny1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z6tZmEdAIz11OEqcWv4ru9dd59l195jpVVBqhcrPEX0=;
        b=JkwyalNXjX7PjmLt8LkC/VIsJpnoa7opQm0Vbb9ZCg4sV5bTGeHYD2NhAO3Rn22QxP
         NY3C8Jxu8yF/DCeXYkurxwGVfXQeGStQInOPsKMSr2g71IFIThJLlfQOIcS6gUgnc2lq
         T9OCjZ20L0KHSNtCWSzHJhzo4SPJBw0ovc/kBUPNdPB9qPD/NHirjc6p85BUyBsDzkjK
         kDaZGxllkopTMq0VQoeWDCezGf0LQId6N3w0kwPmC7Q8uQtdLclbxkdR8TeixBnKb905
         ic9JgJN78l0n5Edj0NX5U5OvgXVH89Eddln6tnB+/d6gGiMyXajz3S8w40tSkD7RaPlc
         R9eg==
X-Gm-Message-State: AOAM530BVHrw1c3ejvWtmTksF24HjB9seoLzCenxEHVo0gg2iKjJy5lm
        C7FcWZJE+MCPhcqynKpuwa77oav1zDQPjVN3+/sYtXsR
X-Google-Smtp-Source: ABdhPJxmYZBVLPMzHd01YjkZ1aFsjrBspMiLEGOz9QhxZGt/1hRiurlQF4pwMVqQ4dZx9aXW9hZKyd+pnduGc0ij7aw=
X-Received: by 2002:a05:6808:10d:: with SMTP id b13mr26104833oie.116.1620888500694;
 Wed, 12 May 2021 23:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1614172241-17326-9-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20210306202022.GA1146983@robh.at.kernel.org> <CAKfKVtF8FAAt-Rszq62hBtJWokYXrKH_DwU1cGvXzBni99VM+A@mail.gmail.com>
 <14254feb-ddbd-068d-74a4-61407177336d@xilinx.com> <161801117111.2941957.3980674660268189208@swboyd.mtv.corp.google.com>
In-Reply-To: <161801117111.2941957.3980674660268189208@swboyd.mtv.corp.google.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 13 May 2021 12:18:09 +0530
Message-ID: <CAKfKVtGJ2ANtJ2GW1gcU8qOXp1fY=Xs=i3PBHg=5QZApa9VjyQ@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] dt-bindings: add documentation of xilinx clocking wizard
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mike Turquette <mturquette@baylibre.com>, git@xilinx.com,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devel@driverdev.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Apr 10, 2021 at 5:02 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Michal Simek (2021-04-08 03:40:29)
> >
> >
> > On 4/8/21 12:26 PM, Shubhrajyoti Datta wrote:
> > > On Sun, Mar 7, 2021 at 1:50 AM Rob Herring <robh@kernel.org> wrote:
> > >>
> > >> On Wed, Feb 24, 2021 at 06:40:40PM +0530, Shubhrajyoti Datta wrote:
> > >>> Add the devicetree binding for the xilinx clocking wizard.
> > >>>
> > >>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > >>> ---
...
> >
> > In designed tools it is your responsibility to select proper chip based
> > on your order and then this value is propagated in Xilinx standard way
> > via device tree generator to fill the right value for this property.
>
> The OPP framework and binding has support for speed grades via the
> 'supported-hw' property. I expect this speed-grade property could be
> dropped and an opp table could be assigned to the clk controller node
> for this speed grade by the DT author. Unfortunate that it isn't burned
> somewhere into the device so that software can pick the right frequency
> limits that way.

Rob let me know your opinion I will implement it in that way.
