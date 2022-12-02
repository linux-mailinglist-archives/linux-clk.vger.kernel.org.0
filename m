Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABE2640A55
	for <lists+linux-clk@lfdr.de>; Fri,  2 Dec 2022 17:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233799AbiLBQMQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 2 Dec 2022 11:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbiLBQMN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 11:12:13 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57278ACA6D
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 08:12:10 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id d14so2143380edj.11
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 08:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bz5f4zL5wYGc031JRJNMmmPVTjKmJYPCIfit1sIYYRA=;
        b=lY0BXQrFkYFmQLJWCUQAeYKpYMl2mG+emRVS2a7k+2d56y8JuSYCmr51xCF7vicwl5
         EgqicGx1GVkfR5z/QlyPuvaRAUk35Wi+kzXD1nCsrowE2XzYrwD3/U7V4ulNwloN6JjY
         GpraWjPbuoz2wVSa2T6U+vsELLV9Hh3AGNLGboOnrdk8OzVRtD5zXXaV8BiQGfR/RCbK
         0LQi8kVZSSmbZRLUKhlQclUDLOylUzaFbQ+jYKSPvBtCFkLhSyWTXZXK5M70VdOo4Idp
         zl0N3id0i1FhBkQ1EANx0b2bb4DA5ZZGcijWQCxP8cyiXKIPeCnhbSf2TPVJ+plO6bye
         wCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz5f4zL5wYGc031JRJNMmmPVTjKmJYPCIfit1sIYYRA=;
        b=b449bEYYosEKvxtpKR1sF66Q9EwHAVH2UASxUiliz5wnp2Xsx7Esq8DGqHXA4x2Pho
         5tpy5ovYKgS2iNTMbEAl29IMFakHgFLi2856/ZZOj1nnlOG+52QRABrQNbb033hBAaxO
         G9VUBDs0xPAAng+G3WPlJ6gzVjUNPfv8r6xlfEUcTXy7TzXGmZpwhZtDi2/waqyBmMGQ
         mKBPTaQRLxf3VjmOsyeTMEhYNhyIolgFuyFLj76A/fqms/1nHPXJxH38sPzVmk56F9tO
         oJUm7H+N124LzaiD13deGFcA9nHbfuGOWpTi0GgUm8qJP3yMghw4j7uTrxfLUzsJR0Vr
         ToPg==
X-Gm-Message-State: ANoB5plt2ZFQ1b0A66JWHbU0vGnTsFRdp7geBJOIWA+qVSB0xovMmdUr
        ITeyWrBuHguLPY89v14yhqw1bw==
X-Google-Smtp-Source: AA0mqf4Q/72OiRSV9ieJb7mpBGCe7gnJ07an05NKjS/XOtjFuoW+gNP1dogJ0wnbkKbl6WQ9Msl4vg==
X-Received: by 2002:aa7:c754:0:b0:46b:6096:a884 with SMTP id c20-20020aa7c754000000b0046b6096a884mr18355252eds.152.1669997528685;
        Fri, 02 Dec 2022 08:12:08 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id c9-20020a170906762900b007be3aa82543sm3162631ejn.35.2022.12.02.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:12:07 -0800 (PST)
Date:   Fri, 2 Dec 2022 17:12:06 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vfedorenko@novek.ru>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v4 0/4] Create common DPLL/clock configuration API
Message-ID: <Y4oj1q3VtcQdzeb3@nanopsycho>
References: <20221129213724.10119-1-vfedorenko@novek.ru>
 <Y4dNV14g7dzIQ3x7@nanopsycho>
 <DM6PR11MB4657003794552DC98ACF31669B179@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657003794552DC98ACF31669B179@DM6PR11MB4657.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Dec 02, 2022 at 12:27:24PM CET, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Wednesday, November 30, 2022 1:32 PM
>>
>>Tue, Nov 29, 2022 at 10:37:20PM CET, vfedorenko@novek.ru wrote:
>>>Implement common API for clock/DPLL configuration and status reporting.
>>>The API utilises netlink interface as transport for commands and event
>>>notifications. This API aim to extend current pin configuration and
>>>make it flexible and easy to cover special configurations.
>>
>>Overall, I see a lot of issues on multiple levels. I will go over them in
>>follow-up emails. So far, after couple of hours looking trought this, I
>>have following general feelings/notes:
>
>Hi Jiri,
>
>As we have been participating in last version, feel obligated to answer to
>the concerns.

Cool.


> 
>>
>>1) Netlink interface looks much saner than in previous versions. I will
>>   send couple of notes, mainly around events and object mixtures and
>>   couple of bugs/redundancies. But overall, looks fineish.
>>
>>2) I don't like that concept of a shared pin, at all. It makes things
>>   unnecessary complicated. Just have a pin created for dpll instance
>>   and that's it. If another instance has the same pin, it should create
>>   it as well. Keeps things separate and easy to model. Let the
>>   hw/fw/driver figure out the implementation oddities.
>>   Why exactly you keep pushing the shared pin idea? Perhaps I'm missing
>>   something crucial.
>
>
>If the user request change on pin#0 of dpll#0, the dpll#0 knows about the
>change, it reacts accordingly, and notifies the user the something has changed.
>Which is rather simple.
>
>Now, if the dpll#1 is using the same pin (pin#0 of dpll#0), the complicated
>part starts. First we have to assume:
>- it was initialized with the same description (as it should, to prevent
>confusing the user)
>- it was initialized with the same order (this is at least nice to have from
>user POV, as pin indices are auto generated), and also in case of multiple pins
>being shared it would be best for the user to have exactly the same number of
>pins initialized, so they have same indices and initialization order doesn't
>introduce additional confusion.
>
>Thus, one reason of shared pins was to prevent having this assumptions ever.
>If the pin is shared, all dplls sharing a pin would have the same description
>and pin index for a shared pin out of the box.
>
>Pin attribute changes
>The change on dpll#0 pin#0 impacts also dpll#1 pin#0. Notification about the
>change shall be also requested from the driver that handles dpll#1. In such
>case the driver has to have some dpll monitoring/notifying mechanics, which at
>first doesn't look very hard to do, but most likely only if both dplls are
>initialized and managed by a single instance of a driver/firmware.
>
>If board has 2 dplls but each one is managed by its own firmware/driver
>instance. User changes frequency of pin#0 signal, the driver of dpll#0 must
>also notify driver of dpll#1 that pin#0 frequency has changed, dpll#1 reacts on
>the change, notifies the user.

Right.


>But this is only doable with assumption, that the board is internally capable
>of such internal board level communication, which in case of separated
>firmwares handling multiple dplls might not be the case, or it would require
>to have some other sw component feel that gap.

Yep, you have the knowledge of sharing inside the driver, so you should
do it there. For multiple instances, use in-driver notifier for example.


>
>For complex boards with multiple dplls/sync channels, multiple ports,
>multiple firmware instances, it seems to be complicated to share a pin if
>each driver would have own copy and should notify all the other about changes.
>
>To summarize, that is certainly true, shared pins idea complicates stuff
>inside of dpll subsystem.
>But at the same time it removes complexity from all the drivers which would use

There are currently 3 drivers for dpll I know of. This in ptp_ocp and
mlx5 there is no concept of sharing pins. You you are talking about a
single driver.

What I'm trying to say is, looking at the code, the pin sharing,
references and locking makes things uncomfortably complex. You are so
far the only driver to need this, do it internally. If in the future
other driver appears, this code would be eventually pushed into dpll
core. No impact on UAPI from what I see. Please keep things as simple as
possible.


>it and is easier for the userspace due to common identification of pins.

By identification, you mean "description" right? I see no problem of 2
instances have the same pin "description"/label.


>This solution scales up without any additional complexity in the driver,
>and without any need for internal per-board communication channels.
>
>Not sure if this is good or bad, but with current version, both approaches are
>possible, so it pretty much depending on the driver to initialize dplls with
>separated pin objects as you have suggested (and take its complexity into
>driver) or just share them.
>
>>
>>3) I don't like the concept of muxed pins and hierarchies of pins. Why
>>   does user care? If pin is muxed, the rest of the pins related to this
>>   one should be in state disabled/disconnected. The user only cares
>>   about to see which pins are related to each other. It can be easily
>>   exposed by "muxid" like this:
>>   pin 1
>>   pin 2
>>   pin 3 muxid 100
>>   pin 4 muxid 100
>>   pin 5 muxid 101
>>   pin 6 muxid 101
>>   In this example pins 3,4 and 5,6 are muxed, therefore the user knows
>>   if he connects one, the other one gets disconnected (or will have to
>>   disconnect the first one explicitly first).
>>
>
>Currently DPLLA_PIN_PARENT_IDX is doing the same thing as you described, it
>groups MUXed pins, the parent pin index here was most straightforward to me,

There is a big difference if we model flat list of pins with a set of
attributes for each, comparing to a tree of pins, some acting as leaf,
node and root. Do we really need such complexicity? What value does it
bring to the user to expose this?


>as in case of DPLL_MODE_AUTOMATIC, where dpll auto-selects highest priority
>available signal. The priority can be only assigned to the pins directly
>connected to the dpll. The rest of pins (which would have present
>attribute DPLLA_PIN_PARENT_IDX) are the ones that require manual selection
>even if DPLL_MODE_AUTOMATIC is enabled.
>
>Enabling a particular pin and sub-pin in DPLL_MODE_AUTOMATIC requires from user
>to select proper priority on on a dpll-level MUX-pin and manually select one of
>the sub-pins.  
>On the other hand for DPLL_MODE_FORCED, this might be also beneficial, as the
>user could select a directly connected pin and muxed pin with two separated
>commands, which could be handled in separated driver instances (if HW design
>requires such approach) or either it can be handled just by one select call
>for the pin connected directly and handled entirely in the one driver instance.

Talk netlink please. What are the actual commands with cmds used to
select the source and select a mux pin? You are talking about 2 types of
selections:
1) Source select
   - this is as you described either auto/forces (manual) mode,
   according to some prio, dpll select the best source
2) Pin select in a mux
   - here the pin could be source or output

But again, from the user perspective, why does he have to distinguish
these? Extending my example:

   pin 1 source
   pin 2 output
   pin 3 muxid 100 source
   pin 4 muxid 100 source
   pin 5 muxid 101 source
   pin 6 muxid 101 source
   pin 7 output

User now can set individial prios for sources:

dpll x pin 1 set prio 10
etc
The result would be:

   pin 1 source prio 10
   pin 2 output
   pin 3 muxid 100 source prio 8
   pin 4 muxid 100 source prio 20
   pin 5 muxid 101 source prio 50
   pin 6 muxid 101 source prio 60
   pin 7 output

Now when auto is enabled, the pin 3 is selected. Why would user need to
manually select between 3 and 4? This is should be abstracted out by the
driver.

Only issues I see when pins are output. User would have to somehow
select one of the pins in the mux (perhaps another dpll cmd). But the
mux pin instance does not help with anything there...



>
>>4) I don't like the "attr" indirection. It makes things very tangled. It
>>   comes from the concepts of classes and objects and takes it to
>>   extreme. Not really something we are commonly used to in kernel.
>>   Also, it brings no value from what I can see, only makes things very
>>   hard to read and follow.
>>
>
>Yet again, true, I haven't find anything similar in the kernel, it was more
>like a try to find out a way to have a single structure with all the stuff that
>is passed between netlink/core/driver parts. Came up with this, and to be
>honest it suits pretty well, those are well defined containers. They store
>attributes that either user or driver have set, with ability to obtain a valid
>value only if it was set. Thus whoever reads a struct, knows which of those
>attributes were actually set.

Sorry for being blunt here, but when I saw the code I remembered my days
as a student where they forced us to do similar things Java :)
There you tend to make things contained, everything is a class, getters,
setters and whatnot. In kernel, this is overkill.

I'm not saying it's functionally wrong. What I say is that it is
completely unnecessary. I see no advantage, by having this indirection.
I see only disadvantages. It makes code harder to read and follow.
What I suggest, again, is to make things nice and simple. Set of ops
that the driver implements for dpll commands or parts of commands,
as we are used to in the rest of the kernel.


>As you said, seems a bit revolutionary, but IMHO it simplifies stuff, and
>basically it is value and validity bit, which I believe is rather common in the
>kernel, this differs only with the fact it is encapsulated. No direct access to
>the fields of structure is available for the users.

I don't see any reason for any validity bits whan you just do it using
driver-implemented ops.


>Most probably there are some things that could be improved with it, but in
>general it is very easy to use and understand how it works.
>What could be improved:
>- naming scheme as function names are a bit long right now, although mostly
>still fits the line-char limits, thus not that problematic
>- bit mask values are capable of storing 32 bits and bit(0) is always used as
>unspec, which ends up with 31 values available for the enums so if by any
>chance one of the attribute enums would go over 32 it could be an issue.
> 
>It is especially useful for multiple values passed with the same netlink
>attribute id. I.e. please take a look at dpll_msg_add_pin_types_supported(..)
>function.
>
>>   Please keep things direct and simple:
>>   * If some option could be changed for a pin or dpll, just have an
>>     op that is directly called from netlink handler to change it.
>>     There should be clear set of ops for configuration of pin and
>>     dpll object. This "attr" indirection make this totally invisible.
>
>In last review you have asked to have rather only set and get ops defined
>with a single attribute struct. This is exactly that, altough encapsulated.

For objects, yes. Pass a struct you directly read/write if the amount of
function args would be bigger then say 4. The whole encapsulation is not
good for anything.


>
>>   * If some attribute is const during dpll or pin lifetime, have it
>>     passed during dpll or pin creation.
>>
>>
>
>Only driver knows which attributes are const and which are not, this shall

Nonono. This is semantics defined by the subsystem. The pin
label/description for example. That is const, cannot be set by the user.
The type of the pin (synce/gnss/ext) is const, cannot be set by the user.
This you have to clearly specify when you define driver API.
This const attrs should be passed during pin creation/registration.

Talking about dpll instance itself, the clock_id, clock_quality, these
should be also const attrs.



>be also part of driver implementation.
>As I understand all the fields present in (dpll/dpll_pin)_attr, used in get/set
>ops, could be altered in run-time depending on HW design.
>
>Thanks,
>Arkadiusz
>
>>
>>>
>>>v3 -> v4:
>>> * redesign framework to make pins dynamically allocated (Arkadiusz)
>>> * implement shared pins (Arkadiusz)
>>>v2 -> v3:
>>> * implement source select mode (Arkadiusz)
>>> * add documentation
>>> * implementation improvements (Jakub)
>>>v1 -> v2:
>>> * implement returning supported input/output types
>>> * ptp_ocp: follow suggestions from Jonathan
>>> * add linux-clk mailing list
>>>v0 -> v1:
>>> * fix code style and errors
>>> * add linux-arm mailing list
>>>
>>>
>>>Arkadiusz Kubalewski (1):
>>>  dpll: add dpll_attr/dpll_pin_attr helper classes
>>>
>>>Vadim Fedorenko (3):
>>>  dpll: Add DPLL framework base functions
>>>  dpll: documentation on DPLL subsystem interface
>>>  ptp_ocp: implement DPLL ops
>>>
>>> Documentation/networking/dpll.rst  | 271 ++++++++
>>> Documentation/networking/index.rst |   1 +
>>> MAINTAINERS                        |   8 +
>>> drivers/Kconfig                    |   2 +
>>> drivers/Makefile                   |   1 +
>>> drivers/dpll/Kconfig               |   7 +
>>> drivers/dpll/Makefile              |  11 +
>>> drivers/dpll/dpll_attr.c           | 278 +++++++++
>>> drivers/dpll/dpll_core.c           | 760 +++++++++++++++++++++++
>>> drivers/dpll/dpll_core.h           | 176 ++++++
>>> drivers/dpll/dpll_netlink.c        | 963 +++++++++++++++++++++++++++++
>>> drivers/dpll/dpll_netlink.h        |  24 +
>>> drivers/dpll/dpll_pin_attr.c       | 456 ++++++++++++++
>>> drivers/ptp/Kconfig                |   1 +
>>> drivers/ptp/ptp_ocp.c              | 123 ++--
>>> include/linux/dpll.h               | 261 ++++++++
>>> include/linux/dpll_attr.h          | 433 +++++++++++++
>>> include/uapi/linux/dpll.h          | 263 ++++++++
>>> 18 files changed, 4002 insertions(+), 37 deletions(-) create mode
>>> 100644 Documentation/networking/dpll.rst create mode 100644
>>> drivers/dpll/Kconfig create mode 100644 drivers/dpll/Makefile create
>>> mode 100644 drivers/dpll/dpll_attr.c create mode 100644
>>> drivers/dpll/dpll_core.c create mode 100644 drivers/dpll/dpll_core.h
>>> create mode 100644 drivers/dpll/dpll_netlink.c create mode 100644
>>> drivers/dpll/dpll_netlink.h create mode 100644
>>> drivers/dpll/dpll_pin_attr.c create mode 100644 include/linux/dpll.h
>>> create mode 100644 include/linux/dpll_attr.h create mode 100644
>>> include/uapi/linux/dpll.h
>>>
>>>--
>>>2.27.0
>>>
