Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E209911760
	for <lists+linux-clk@lfdr.de>; Thu,  2 May 2019 12:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfEBKix (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 2 May 2019 06:38:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:42374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbfEBKix (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 May 2019 06:38:53 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CEC922075E;
        Thu,  2 May 2019 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556793531;
        bh=ORS7MqKgv0S4c66duHHzTYFC3hek0qJa0hLcabmXALQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xxVV4J+M4k5Ushl/VdQC1Foc6e9iXq2TCyCJ7kS1vv7wx5fLcyfjdBIV4HIod41qj
         WkKz1Evhhg4eMqjjQ08komjHr95SSoKsfEzkKAT/0tsToD5NugJ95ccvzDoITQRWC/
         i0HvmBTfpYGVnTQt0FfWSp8NsbbNz1zinX81zZbM=
Date:   Thu, 2 May 2019 12:38:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     Nishad Kamdar <nishadkamdar@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Joe Perches <joe@perches.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH] clk: actions: Use the correct style for SPDX License
 Identifier
Message-ID: <20190502103848.GA17256@kroah.com>
References: <20190501070707.GA5619@nishad>
 <057d9b37-7475-1902-bce7-6d519c2e0fdf@suse.de>
 <20190502070746.GA16247@kroah.com>
 <315de620-b638-aea4-d8d2-e00f5a493625@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <315de620-b638-aea4-d8d2-e00f5a493625@suse.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 02, 2019 at 12:25:36PM +0200, Andreas F�rber wrote:
> Am 02.05.19 um 09:07 schrieb Greg Kroah-Hartman:
> > On Wed, May 01, 2019 at 10:20:44PM +0200, Andreas F�rber wrote:
> >> + linux-actions
> >>
> >> Am 01.05.19 um 09:07 schrieb Nishad Kamdar:
> >>> This patch corrects the SPDX License Identifier style
> >>> in header files related to Clock Drivers for Actions Semi Socs.
> >>> For C header files Documentation/process/license-rules.rst
> >>> mandates C-like comments (opposed to C source files where
> >>> C++ style should be used)
> >> [...]
> >>>  drivers/clk/actions/owl-common.h       | 2 +-
> >>>  drivers/clk/actions/owl-composite.h    | 2 +-
> >>>  drivers/clk/actions/owl-divider.h      | 2 +-
> >>>  drivers/clk/actions/owl-factor.h       | 2 +-
> >>>  drivers/clk/actions/owl-fixed-factor.h | 2 +-
> >>>  drivers/clk/actions/owl-gate.h         | 2 +-
> >>>  drivers/clk/actions/owl-mux.h          | 2 +-
> >>>  drivers/clk/actions/owl-pll.h          | 2 +-
> >>>  drivers/clk/actions/owl-reset.h        | 2 +-
> >>>  9 files changed, 9 insertions(+), 9 deletions(-)
> >>
> >> Where's the practical benefit of this patch? These are all private
> >> headers used from C files, so they can handle C++ comments just fine,
> >> otherwise we would've seen build failures.
> > 
> > Please read Documentation/process/license-rules.rst, the section
> > entitled "Style", for what the documented formats are for SPDX lines,
> > depending on the file type.
> 
> That does in no way answer my question! You conveniently dropped my
> paragraph indicating that I understand why we would do that for public
> headers in include/, but none of these private headers here are included
> in .lds files. So there really seems to be no benefit of switching from
> one style to another for in-tree code.

It should answer the question, it was "decreed" that all header files
use /* */, and all C files use // for their SPDX lines, so we documented
it that way.

Yes, maybe it doesn't make "sense" in that this really is only needed
for headers that get included into asm files, which is why we had to do
it this way, but it's better to be consistant than to have random
breakages at times.

It's not an issue of public headers at all, sorry.

Consistency is good, as we can have automatic tools check these types of
things, which is the only way to reliably handle the format of something
that needs to be in every file in a project with 63,100+ different
files.

thanks,

greg k-h
> 
> Regards,
> Andreas
> 
> -- 
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N�rnberg, Germany
> GF: Felix Imend�rffer, Mary Higgins, Sri Rasiah
> HRB 21284 (AG N�rnberg)
